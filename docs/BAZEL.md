# Bazel

To build:

```
$ bazel build snarky-bn382
```

List visible targets:

`$ bazel query 'attr(visibility, "//visibility:public", //...:all)' | sort`

You can ignore the `//cargo` and `//bzl` targets. `//:verbose` is a
command line switch, to use it pass `--//:verbose`.

Bazel supports CLI completion, so you can type e.g. `$ bazel build
circuits` and whale on the tab key until you find a target (targets
will always involve ':' after the dir name).

Cargo builds should continue to work; adding Bazel support requires no
changes to existing code, only the addition of some files.

If you run into trouble, or you just want more verbose output, copy
`.bazelrc` to user.bazelrc and uncomment the relevent lines.

Dependencies can be built independently.  Examples:

```
$ bazel build algebra
$ bazel build gm17
$ bazel build ff-fft
```

The first two examples exploit some Bazel conveniences.  First, you can generally omit the leading `//`, so `build algebra` is short for `build //algebra`. Second, if the package name is the same as the target name, you can omit the target.  So `algebra` is short for `algebra:algebra`.

The third example explicitly lists package and target (`ff-fft` is the
package, `ff_fft` is the target).  That's a requirement, since Bazel,
like Rust/Cargo, is not fond of hyphens.  The (Bazel) package path may
contain them, but the target string may not. By convention they are
translated to underscores '-'.

## Queries

Bazel includes a powerful [query facility](https://docs.bazel.build/versions/master/query-how-to.html).  Examples:

List all visible targets (targets with `visibility = ["//visibility:public"],`):

`$ bazel query 'attr(visibility, "//visibility:public", //...:all)' | sort`

List all deps of `dpc`:

`$ bazel query "deps(//dpc)" --notool_deps --output package | sort`

How does `dpc` depend on `ff-fft`, or `rand`?

```
$ bazel query "allpaths(//dpc, //ff-fft)"
//dpc:dpc
//crypto-primitives:crypto-primitives
//groth16:groth16
//gm17:gm17
//ff-fft:ff-fft
```

```
$ bazel query "allpaths(//dpc, @raze__rand__0_7_3//:rand)"
//dpc:dpc
//crypto-primitives:crypto-primitives
//r1cs-std:r1cs-std
//groth16:groth16
//gm17:gm17
//r1cs-core:r1cs-core
//ff-fft:ff-fft
//algebra:algebra
//cargo:rand
@raze__rand__0_7_3//:rand
```

Since `rand` is aliased, the previous query can be expressed more
succinctly as

```
bazel query "allpaths(//dpc, //cargo:rand)"
```

## Maintenance

Use [cargo-raze](https://github.com/google/cargo-raze) to manage Bazel support.

To update:

* edit `cargo/Cargo.toml`
* from within `cargo/` run `$ cargo raze`
* test the build
* to pin versions, from within `cargo` run `$ cargo generate-lockfile`
* commit changes to git

IMPORTANT: the cargo/Cargo.toml file must list the deps of marlin as
well as those of zexe. The workspace file can import the Marlin
repository, but it will not evaluate Marlin's WORKSPACE rules to acquire
its dependencies. So they must be included here.


## NOTES

* External deps are managed in the [cargo](./cargo) subdirectory.
  * Configuration is based on the output of [cargo raze](https://github.com/google/cargo-raze), which generates `BUILD.bazel` files from `Cargo.toml` files.  The details are a little gory (better docs are in the works), but in short, `cargo raze` does the following for the transitive dependency graph of each dependency listed in [cargo/Cargo.toml](./cargo/Cargo.toml):
  * Adds a `new_git_repository` or `new_http_archive` entry to
    [cargo/crates.bzl](./cargo/BUILD.bazel).  At build time, Bazel
    will use these to dynamically set up the repositories in its local
    cache.  The entries are available as Bazel labels, e.g. for
    `_new_git_repository( name = "raze__algebra__0_1_0"` we get
    `@raze__algebra__0_1_0//pkg:target`.
  * Adds a BUILD.bazel file in [cargo/remote](./cargo/remote). These
    files are generated from the `Cargo.toml` files in the source.
    They contain the Bazel rules (mostly `rust_binary` and
    `rust_library`) needed to build the outputs.
  * Adds an alias entry to
    [cargo/BUILD.bazel](./cargo/BUILD.bazel). This is for convenience;
    it means we can say e.g. `//cargo:algebra` instead of
    `@raze__algebra__0_1_0//:algebra`.

WARNING: the translation from `Cargo.toml` to `BUILD.bazel` is not
flawless; some of the generated files must be edited, which is why
they are under version control.

Bazel supports tab completion, which can be useful if you're not sure
what targets are in a package, or you forgot the hyphen rule. If you
get no such target, e.g. for `bazel build ff-fft`, just add a colon
and hit tab to see the targets defined in the package.

