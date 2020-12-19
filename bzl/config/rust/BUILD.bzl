## Not currently used. Contains the beginnings of Bazelized support for Rust/Cargo profiles.

RUST_CRATE_TYPE = select({
    "//bzl/host:macos": "cdylib",
    "//bzl/host:linux": "staticlib",
}, no_match_error = "Unsupported platform. Linux and MacOS only")

## Rust profiles are determined by Cargo, not the language, so we need
## to implement them in Bazel.
## https://doc.rust-lang.org/rustc/codegen-options/index.html
## defaults (from https://doc.rust-lang.org/cargo/reference/profiles.html)

RUST_PROFILE_DEV = [
    # [profile.dev]
    "-C", "opt-level=0",
    "-C", "debuginfo=2",
    "-C", "debug-assertions=on",
    "-C", "overflow-checks=on",
    "-C", "lto=off",
    "-C", "panic=unwind",
    "-C", "incremental=on",
    "-C", "codegen-units=256",
    "-C", "rpath=off" # = default
]

RUST_PROFILE_RELEASE = [
    # [profile.release]
    "-C", "opt-level=3",
    "-C", "debuginfo=0",
    "-C", "debug-assertions=off",
    "-C", "overflow-checks=off",
    "-C", "lto=off",
    "-C", "panic=unwind",
    "-C", "incremental=off",
    "-C", "codegen-units=16",
    "-C", "rpath=off" # default
]

## TEST profile defaults
# [profile.test]
# opt-level = 0
# debug = 2
# debug-assertions = true
# overflow-checks = true
# lto = false
# panic = 'unwind'    # This setting is always ignored.
# incremental = true
# codegen-units = 256
# rpath = false

## BENCH profile defaults
# [profile.bench]
# opt-level = 3
# debug = false # 0
# debug-assertions = false
# overflow-checks = false
# lto = false
# panic = 'unwind'    # This setting is always ignored.
# incremental = false
# codegen-units = 16
# rpath = false

RUST_PROFILE = select({
    "//bzl/config/rust:profile_dev": RUST_PROFILE_DEV,
    "//bzl/config/rust:profile_release": RUST_PROFILE_RELEASE,
    # "//bzl/config/rust:profile_test": RUST_PROFILE_TEST,
    # "//bzl/config/rust:profile_bench": RUST_PROFILE_BENCH,
}, no_match_error = "Unsupported profile. Only dev and release supported atm.")
