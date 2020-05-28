This is a fork, for adding Bazel support to Zexe.  See the master branch for the original README.

## Building

To build:

```
$ bazel build dpc
```

Cargo builds should continue to work; adding Bazel support requires no
changes to existing code, only the addition of some files.

If you run into trouble, or you just want more verbose output, copy
`.bazelrc` to user.bazelrc and uncomment the relevent lines.

WARNING: you'll probably see some error messages along the lines of

```
INFO: From Executing genrule @raze__crossbeam_epoch__0_8_2//:crossbeam_epoch_build_script_executor:
error[E0463]: can't find crate for `std`
```

This is due to a known problem that does not seem to affect the Zexe
build, so we can ignore these messages for now.

Dependencies can be built independently.  Examples:

```
$ bazel build algebra
$ bazel build gm17
$ bazel build ff-fft:ff_fft
```

The first two examples exploit some Bazel conveniences.  First, you can generally omit the leading `//`, so `build algebra` is short for `build //algebra`. Second, if the package name is the same as the target name, you can omit the target.  So `algebra` is short for `algebra:algebra`.

The third example explicitly lists package and target (`ff-fft` is the
package, `ff_fft` is the target).  That's a requirement, since Bazel,
like Rust/Cargo, is not fond of hyphens.  The (Bazel) package path may
contain them, but the target string may not. By convention they are
translated to underscores '-'.

## Queries

Bazel includes a powerful [query facility](https://docs.bazel.build/versions/master/query-how-to.html).  Examples:

List all deps of `dpc`:

`$ bazel query "deps(//dpc)" --notool_deps --output package | sort`

How does `dpc` depend on `ff-fft`, or `rand`?

```
$ bazel query "allpaths(//dpc, //ff-fft:ff_fft)"
//dpc:dpc
//crypto-primitives:crypto_primitives
//groth16:groth16
//gm17:gm17
//ff-fft:ff_fft
```

```
$ bazel query "allpaths(//dpc, @raze__rand__0_7_3//:rand)"
//dpc:dpc
//crypto-primitives:crypto_primitives
//r1cs-std:r1cs_std
//groth16:groth16
//gm17:gm17
//r1cs-core:r1cs_core
//ff-fft:ff_fft
//algebra:algebra
//cargo:rand
@raze__rand__0_7_3//:rand
```

Since `rand` is aliased, the previous query can be expressed more
succinctly as

```
bazel query "allpaths(//dpc, //cargo:rand)"
```

## NOTES

* This uses a patched version of `rules_rust`; see the git_repository
  entry in WORKSPACE for details.
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

