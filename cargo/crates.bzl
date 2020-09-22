"""
@generated
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__alga__0_9_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/alga/alga-0.9.3.crate",
        type = "tar.gz",
        sha256 = "4f823d037a7ec6ea2197046bafd4ae150e6bc36f9ca347404f46a46823fa84f2",
        strip_prefix = "alga-0.9.3",
        build_file = Label("//cargo/remote:alga-0.9.3.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__algebra__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:algebra-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__algebra_benches__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:algebra-benches-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__algebra_core__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:algebra-core-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__approx__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/approx/approx-0.3.2.crate",
        type = "tar.gz",
        sha256 = "f0e60b75072ecd4168020818c0107f2857bb6c4e64252d8d3983f6263b40a5c3",
        strip_prefix = "approx-0.3.2",
        build_file = Label("//cargo/remote:approx-0.3.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__array_init__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/array-init/array-init-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "array-init-0.1.1",
        build_file = Label("//cargo/remote:array-init-0.1.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/atty/atty-0.2.14.crate",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//cargo/remote:atty-0.2.14.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/autocfg/autocfg-0.1.7.crate",
        type = "tar.gz",
        strip_prefix = "autocfg-0.1.7",
        build_file = Label("//cargo/remote:autocfg-0.1.7.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/autocfg/autocfg-1.0.0.crate",
        type = "tar.gz",
        sha256 = "f8aac770f1885fd7e387acedd76065302551364496e46b3dd00860b2f8359b9d",
        strip_prefix = "autocfg-1.0.0",
        build_file = Label("//cargo/remote:autocfg-1.0.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bitflags/bitflags-1.2.1.crate",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//cargo/remote:bitflags-1.2.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__blake2__0_7_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/blake2/blake2-0.7.1.crate",
        type = "tar.gz",
        sha256 = "73b77e29dbd0115e43938be2d5128ecf81c0353e00acaa65339a1242586951d9",
        strip_prefix = "blake2-0.7.1",
        build_file = Label("//cargo/remote:blake2-0.7.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__blake2__0_8_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/blake2/blake2-0.8.1.crate",
        type = "tar.gz",
        sha256 = "94cb07b0da6a73955f8fb85d24c466778e70cda767a568229b104f0264089330",
        strip_prefix = "blake2-0.8.1",
        build_file = Label("//cargo/remote:blake2-0.8.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bstr__0_2_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bstr/bstr-0.2.13.crate",
        type = "tar.gz",
        sha256 = "31accafdb70df7871592c058eca3985b71104e15ac32f64706022c58867da931",
        strip_prefix = "bstr-0.2.13",
        build_file = Label("//cargo/remote:bstr-0.2.13.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bumpalo__3_3_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bumpalo/bumpalo-3.3.0.crate",
        type = "tar.gz",
        sha256 = "5356f1d23ee24a1f785a56d1d1a5f0fd5b0f6a0c0fb2412ce11da71649ab78f6",
        strip_prefix = "bumpalo-3.3.0",
        build_file = Label("//cargo/remote:bumpalo-3.3.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byte_tools__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byte-tools/byte-tools-0.2.0.crate",
        type = "tar.gz",
        sha256 = "560c32574a12a89ecd91f5e742165893f86e3ab98d21f8ea548658eb9eef5f40",
        strip_prefix = "byte-tools-0.2.0",
        build_file = Label("//cargo/remote:byte-tools-0.2.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byte_tools__0_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byte-tools/byte-tools-0.3.1.crate",
        type = "tar.gz",
        sha256 = "e3b5ca7a04898ad4bcd41c90c5285445ff5b791899bb1b0abdd2a2aa791211d7",
        strip_prefix = "byte-tools-0.3.1",
        build_file = Label("//cargo/remote:byte-tools-0.3.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byteorder/byteorder-1.3.4.crate",
        type = "tar.gz",
        sha256 = "08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//cargo/remote:byteorder-1.3.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cast__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cast/cast-0.2.3.crate",
        type = "tar.gz",
        sha256 = "4b9434b9a5aa1450faa3f9cb14ea0e8c53bb5d2b3c1bfd1ab4fc03e9f33fbfb0",
        strip_prefix = "cast-0.2.3",
        build_file = Label("//cargo/remote:cast-0.2.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.10.crate",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//cargo/remote:cfg-if-0.1.10.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__circuits_dlog__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:circuits_dlog-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__circuits_pairing__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:circuits_pairing-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__clap__2_33_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/clap/clap-2.33.1.crate",
        type = "tar.gz",
        sha256 = "bdfa80d47f954d53a35a64987ca1422f495b8d6483c0fe9f7117b36c2a792129",
        strip_prefix = "clap-2.33.1",
        build_file = Label("//cargo/remote:clap-2.33.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__colored__1_9_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/colored/colored-1.9.3.crate",
        type = "tar.gz",
        sha256 = "f4ffc801dacf156c5854b9df4f425a626539c3a6ef7893cc0c5084a23f0b6c59",
        strip_prefix = "colored-1.9.3",
        build_file = Label("//cargo/remote:colored-1.9.3.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__commitment_dlog__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:commitment_dlog-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__commitment_pairing__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:commitment_pairing-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__constant_time_eq__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/constant_time_eq/constant_time_eq-0.1.5.crate",
        type = "tar.gz",
        sha256 = "245097e9a4535ee1e3e3931fcfcd55a796a44c643e8596ff6566d68f09b87bbc",
        strip_prefix = "constant_time_eq-0.1.5",
        build_file = Label("//cargo/remote:constant_time_eq-0.1.5.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__criterion__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/criterion/criterion-0.3.2.crate",
        type = "tar.gz",
        sha256 = "63f696897c88b57f4ffe3c69d8e1a0613c7d0e6c4833363c8560fbde9c47b966",
        strip_prefix = "criterion-0.3.2",
        build_file = Label("//cargo/remote:criterion-0.3.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__criterion_plot__0_4_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/criterion-plot/criterion-plot-0.4.2.crate",
        type = "tar.gz",
        sha256 = "ddeaf7989f00f2e1d871a26a110f3ed713632feac17f65f03ca938c542618b60",
        strip_prefix = "criterion-plot-0.4.2",
        build_file = Label("//cargo/remote:criterion-plot-0.4.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_channel__0_4_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-channel/crossbeam-channel-0.4.4.crate",
        type = "tar.gz",
        strip_prefix = "crossbeam-channel-0.4.4",
        build_file = Label("//cargo/remote:crossbeam-channel-0.4.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_deque__0_7_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-deque/crossbeam-deque-0.7.3.crate",
        type = "tar.gz",
        sha256 = "9f02af974daeee82218205558e51ec8768b48cf524bd01d550abe5573a608285",
        strip_prefix = "crossbeam-deque-0.7.3",
        build_file = Label("//cargo/remote:crossbeam-deque-0.7.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_epoch__0_8_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-epoch/crossbeam-epoch-0.8.2.crate",
        type = "tar.gz",
        sha256 = "058ed274caafc1f60c4997b5fc07bf7dc7cca454af7c6e81edffe5f33f70dace",
        strip_prefix = "crossbeam-epoch-0.8.2",
        build_file = Label("//cargo/remote:crossbeam-epoch-0.8.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_7_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-utils/crossbeam-utils-0.7.2.crate",
        type = "tar.gz",
        sha256 = "c3c7c73a2d1e9fc0886a08b93e98eb643461230d5f1925e4036204d5f2e261a8",
        strip_prefix = "crossbeam-utils-0.7.2",
        build_file = Label("//cargo/remote:crossbeam-utils-0.7.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crypto_mac__0_5_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crypto-mac/crypto-mac-0.5.2.crate",
        type = "tar.gz",
        sha256 = "0999b4ff4d3446d4ddb19a63e9e00c1876e75cd7000d20e57a693b4b3f08d958",
        strip_prefix = "crypto-mac-0.5.2",
        build_file = Label("//cargo/remote:crypto-mac-0.5.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crypto_mac__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crypto-mac/crypto-mac-0.7.0.crate",
        type = "tar.gz",
        sha256 = "4434400df11d95d556bac068ddfedd482915eb18fe8bea89bc80b6e4b1c179e5",
        strip_prefix = "crypto-mac-0.7.0",
        build_file = Label("//cargo/remote:crypto-mac-0.7.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__csv__1_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/csv/csv-1.1.3.crate",
        type = "tar.gz",
        sha256 = "00affe7f6ab566df61b4be3ce8cf16bc2576bca0963ceb0955e45d514bf9a279",
        strip_prefix = "csv-1.1.3",
        build_file = Label("//cargo/remote:csv-1.1.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__csv_core__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/csv-core/csv-core-0.1.10.crate",
        type = "tar.gz",
        sha256 = "2b2466559f260f48ad25fe6317b3c8dac77b5bdb5763ac7d9d6103530663bc90",
        strip_prefix = "csv-core-0.1.10",
        build_file = Label("//cargo/remote:csv-core-0.1.10.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__derivative__2_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/derivative/derivative-2.1.1.crate",
        type = "tar.gz",
        sha256 = "cb582b60359da160a9477ee80f15c8d784c477e69c217ef2cdd4169c24ea380f",
        strip_prefix = "derivative-2.1.1",
        build_file = Label("//cargo/remote:derivative-2.1.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_7_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/digest/digest-0.7.6.crate",
        type = "tar.gz",
        sha256 = "03b072242a8cbaf9c145665af9d250c59af3b958f83ed6824e13533cf76d5b90",
        strip_prefix = "digest-0.7.6",
        build_file = Label("//cargo/remote:digest-0.7.6.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_8_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/digest/digest-0.8.1.crate",
        type = "tar.gz",
        sha256 = "f3d0c8c8752312f9713efd397ff63acb9f85585afbf179282e720e7704954dd5",
        strip_prefix = "digest-0.8.1",
        build_file = Label("//cargo/remote:digest-0.8.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_5_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/either/either-1.5.3.crate",
        type = "tar.gz",
        sha256 = "bb1f6b1ce1c140482ea30ddd3335fc0024ac7ee112895426e0a629a6c20adfe3",
        strip_prefix = "either-1.5.3",
        build_file = Label("//cargo/remote:either-1.5.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__endian_type__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/endian-type/endian-type-0.1.2.crate",
        type = "tar.gz",
        strip_prefix = "endian-type-0.1.2",
        build_file = Label("//cargo/remote:endian-type-0.1.2.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__evaluation_domains__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:evaluation_domains-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__ff_fft__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:ff-fft-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__field_assembly__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:field-assembly-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_12_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/generic-array/generic-array-0.12.3.crate",
        type = "tar.gz",
        sha256 = "c68f0274ae0e023facc3c97b2e00f076be70e254bc851d972503b328db79b2ec",
        strip_prefix = "generic-array-0.12.3",
        build_file = Label("//cargo/remote:generic-array-0.12.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/generic-array/generic-array-0.9.0.crate",
        type = "tar.gz",
        sha256 = "ef25c5683767570c2bbd7deba372926a55eaae9982d7726ee2a1050239d45b9d",
        strip_prefix = "generic-array-0.9.0",
        build_file = Label("//cargo/remote:generic-array-0.9.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/getrandom/getrandom-0.1.14.crate",
        type = "tar.gz",
        sha256 = "7abc8dd8451921606d809ba32e95b6111925cd2906060d2dcc29c070220503eb",
        strip_prefix = "getrandom-0.1.14",
        build_file = Label("//cargo/remote:getrandom-0.1.14.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__groupmap__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:groupmap-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hermit-abi/hermit-abi-0.1.13.crate",
        type = "tar.gz",
        sha256 = "91780f809e750b0a89f5544be56617ff6b1227ee485bcb06ebe10cdf89bd3b71",
        strip_prefix = "hermit-abi-0.1.13",
        build_file = Label("//cargo/remote:hermit-abi-0.1.13.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itertools__0_8_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/itertools/itertools-0.8.2.crate",
        type = "tar.gz",
        sha256 = "f56a2d0bc861f9165be4eb3442afd3c236d8a98afd426f65d92324ae1091a484",
        strip_prefix = "itertools-0.8.2",
        build_file = Label("//cargo/remote:itertools-0.8.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itertools__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/itertools/itertools-0.9.0.crate",
        type = "tar.gz",
        sha256 = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//cargo/remote:itertools-0.9.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__0_4_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/itoa/itoa-0.4.5.crate",
        type = "tar.gz",
        sha256 = "b8b7a7c0c47db5545ed3fef7468ee7bb5b74691498139e4b3f6a20685dc6dd8e",
        strip_prefix = "itoa-0.4.5",
        build_file = Label("//cargo/remote:itoa-0.4.5.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__js_sys__0_3_39",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/js-sys/js-sys-0.3.39.crate",
        type = "tar.gz",
        sha256 = "fa5a448de267e7358beaf4a5d849518fe9a0c13fce7afd44b06e68550e5562a7",
        strip_prefix = "js-sys-0.3.39",
        build_file = Label("//cargo/remote:js-sys-0.3.39.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazy_static/lazy_static-1.4.0.crate",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//cargo/remote:lazy_static-1.4.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_70",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.70.crate",
        type = "tar.gz",
        sha256 = "3baa92041a6fec78c687fa0cc2b3fae8884f743d672cf551bed1d6dac6988d0f",
        strip_prefix = "libc-0.2.70",
        build_file = Label("//cargo/remote:libc-0.2.70.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libm__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libm/libm-0.2.1.crate",
        type = "tar.gz",
        sha256 = "c7d73b3f436185384286bd8098d17ec07c9a7d2388a6599f824d8502b529702a",
        strip_prefix = "libm-0.2.1",
        build_file = Label("//cargo/remote:libm-0.2.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.4.8.crate",
        type = "tar.gz",
        sha256 = "14b6052be84e6b71ab17edffc2eeabf5c2c3ae1fdb464aae35ac50c67a44e1f7",
        strip_prefix = "log-0.4.8",
        build_file = Label("//cargo/remote:log-0.4.8.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matrixmultiply__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/matrixmultiply/matrixmultiply-0.2.3.crate",
        type = "tar.gz",
        sha256 = "d4f7ec66360130972f34830bfad9ef05c6610a43938a467bcc9ab9369ab3478f",
        strip_prefix = "matrixmultiply-0.2.3",
        build_file = Label("//cargo/remote:matrixmultiply-0.2.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__maybe_uninit__2_0_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/maybe-uninit/maybe-uninit-2.0.0.crate",
        type = "tar.gz",
        sha256 = "60302e4db3a61da70c0cb7991976248362f30319e88850c487b9b95bbf059e00",
        strip_prefix = "maybe-uninit-2.0.0",
        build_file = Label("//cargo/remote:maybe-uninit-2.0.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/memchr/memchr-2.3.3.crate",
        type = "tar.gz",
        sha256 = "3728d817d99e5ac407411fa471ff9800a778d88a24685968b36824eaf4bee400",
        strip_prefix = "memchr-2.3.3",
        build_file = Label("//cargo/remote:memchr-2.3.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_5_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/memoffset/memoffset-0.5.4.crate",
        type = "tar.gz",
        sha256 = "b4fc2c02a7e374099d4ee95a193111f72d2110197fe200272371758f6c3643d8",
        strip_prefix = "memoffset-0.5.4",
        build_file = Label("//cargo/remote:memoffset-0.5.4.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__mince__0_1_0",
        remote = "https://github.com/o1-labs/zexe/",
        commit = "610535945f76ceaf5343454d0cc9baeb7295b19a",
        build_file = Label("//cargo/remote:mince-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__ndarray__0_13_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ndarray/ndarray-0.13.1.crate",
        type = "tar.gz",
        sha256 = "ac06db03ec2f46ee0ecdca1a1c34a99c0d188a0d83439b84bf0cb4b386e4ab09",
        strip_prefix = "ndarray-0.13.1",
        build_file = Label("//cargo/remote:ndarray-0.13.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__nibble_vec__0_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/nibble_vec/nibble_vec-0.0.4.crate",
        type = "tar.gz",
        strip_prefix = "nibble_vec-0.0.4",
        build_file = Label("//cargo/remote:nibble_vec-0.0.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_bigint__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-bigint/num-bigint-0.2.3.crate",
        type = "tar.gz",
        strip_prefix = "num-bigint-0.2.3",
        build_file = Label("//cargo/remote:num-bigint-0.2.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_complex__0_2_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-complex/num-complex-0.2.4.crate",
        type = "tar.gz",
        sha256 = "b6b19411a9719e753aff12e5187b74d60d3dc449ec3f4dc21e3989c3f554bc95",
        strip_prefix = "num-complex-0.2.4",
        build_file = Label("//cargo/remote:num-complex-0.2.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_integer__0_1_43",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-integer/num-integer-0.1.43.crate",
        type = "tar.gz",
        strip_prefix = "num-integer-0.1.43",
        build_file = Label("//cargo/remote:num-integer-0.1.43.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_1_43",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-traits/num-traits-0.1.43.crate",
        type = "tar.gz",
        sha256 = "92e5113e9fd4cc14ded8e499429f396a20f98c772a47cc8622a736e1ec843c31",
        strip_prefix = "num-traits-0.1.43",
        build_file = Label("//cargo/remote:num-traits-0.1.43.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_2_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-traits/num-traits-0.2.11.crate",
        type = "tar.gz",
        sha256 = "c62be47e61d1842b9170f0fdeec8eba98e60e90e5446449a0545e5152acd7096",
        strip_prefix = "num-traits-0.2.11",
        build_file = Label("//cargo/remote:num-traits-0.2.11.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_13_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num_cpus/num_cpus-1.13.0.crate",
        type = "tar.gz",
        sha256 = "05499f3756671c15885fee9034446956fff3f243d6077b91e5767df161f766b3",
        strip_prefix = "num_cpus-1.13.0",
        build_file = Label("//cargo/remote:num_cpus-1.13.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__oorandom__11_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/oorandom/oorandom-11.1.1.crate",
        type = "tar.gz",
        sha256 = "94af325bc33c7f60191be4e2c984d48aaa21e2854f473b85398344b60c9b6358",
        strip_prefix = "oorandom-11.1.1",
        build_file = Label("//cargo/remote:oorandom-11.1.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/opaque-debug/opaque-debug-0.2.3.crate",
        type = "tar.gz",
        sha256 = "2839e79665f131bdb5782e51f2c6c9599c133c6098982a54c794358bf432529c",
        strip_prefix = "opaque-debug-0.2.3",
        build_file = Label("//cargo/remote:opaque-debug-0.2.3.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__oracle__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:oracle-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__paste__0_1_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/paste/paste-0.1.12.crate",
        type = "tar.gz",
        sha256 = "0a229b1c58c692edcaa5b9b0948084f130f55d2dcc15b02fcc5340b2b4521476",
        strip_prefix = "paste-0.1.12",
        build_file = Label("//cargo/remote:paste-0.1.12.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__paste_impl__0_1_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/paste-impl/paste-impl-0.1.12.crate",
        type = "tar.gz",
        sha256 = "2e0bf239e447e67ff6d16a8bb5e4d4bd2343acf5066061c0e8e06ac5ba8ca68c",
        strip_prefix = "paste-impl-0.1.12",
        build_file = Label("//cargo/remote:paste-impl-0.1.12.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__plotters__0_2_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/plotters/plotters-0.2.14.crate",
        type = "tar.gz",
        sha256 = "f9b1d9ca091d370ea3a78d5619145d1b59426ab0c9eedbad2514a4cee08bf389",
        strip_prefix = "plotters-0.2.14",
        build_file = Label("//cargo/remote:plotters-0.2.14.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ppv_lite86__0_2_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ppv-lite86/ppv-lite86-0.2.8.crate",
        type = "tar.gz",
        sha256 = "237a5ed80e274dbc66f86bd59c1e25edc039660be53194b5fe0a482e0f2612ea",
        strip_prefix = "ppv-lite86-0.2.8",
        build_file = Label("//cargo/remote:ppv-lite86-0.2.8.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_hack__0_5_15",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro-hack/proc-macro-hack-0.5.15.crate",
        type = "tar.gz",
        sha256 = "0d659fe7c6d27f25e9d80a1a094c223f5246f6a6596453e09d7229bf42750b63",
        strip_prefix = "proc-macro-hack-0.5.15",
        build_file = Label("//cargo/remote:proc-macro-hack-0.5.15.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__0_4_30",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.30.crate",
        type = "tar.gz",
        sha256 = "cf3d2011ab5c909338f7887f4fc896d35932e29146c12c8d01da6b22a80ba759",
        strip_prefix = "proc-macro2-0.4.30",
        build_file = Label("//cargo/remote:proc-macro2-0.4.30.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-1.0.17.crate",
        type = "tar.gz",
        sha256 = "1502d12e458c49a4c9cbff560d0fe0060c252bc29799ed94ca2ed4bb665a0101",
        strip_prefix = "proc-macro2-1.0.17",
        build_file = Label("//cargo/remote:proc-macro2-1.0.17.BUILD.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__protocol_dlog__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:protocol_dlog-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__protocol_pairing__0_1_0",
        remote = "https://github.com/o1-labs/marlin/",
        commit = "7b222a75e918b5113a81ac2dd3dddf657e93ae9e",
        build_file = Label("//cargo/remote:protocol_pairing-0.1.0.BUILD.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__quote__0_6_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.13.crate",
        type = "tar.gz",
        sha256 = "6ce23b6b870e8f94f81fb0a363d65d86675884b34a09043c81e5562f11c1f8e1",
        strip_prefix = "quote-0.6.13",
        build_file = Label("//cargo/remote:quote-0.6.13.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-1.0.6.crate",
        type = "tar.gz",
        sha256 = "54a21852a652ad6f610c9510194f398ff6f8692e334fd1145fed931f7fbe44ea",
        strip_prefix = "quote-1.0.6",
        build_file = Label("//cargo/remote:quote-1.0.6.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__radix_trie__0_1_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/radix_trie/radix_trie-0.1.6.crate",
        type = "tar.gz",
        strip_prefix = "radix_trie-0.1.6",
        build_file = Label("//cargo/remote:radix_trie-0.1.6.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_7_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.7.3.crate",
        type = "tar.gz",
        sha256 = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03",
        strip_prefix = "rand-0.7.3",
        build_file = Label("//cargo/remote:rand-0.7.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_chacha/rand_chacha-0.2.2.crate",
        type = "tar.gz",
        sha256 = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402",
        strip_prefix = "rand_chacha-0.2.2",
        build_file = Label("//cargo/remote:rand_chacha-0.2.2.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_5_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.5.1.crate",
        type = "tar.gz",
        sha256 = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19",
        strip_prefix = "rand_core-0.5.1",
        build_file = Label("//cargo/remote:rand_core-0.5.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_hc/rand_hc-0.2.0.crate",
        type = "tar.gz",
        sha256 = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c",
        strip_prefix = "rand_hc-0.2.0",
        build_file = Label("//cargo/remote:rand_hc-0.2.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_xorshift__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_xorshift/rand_xorshift-0.2.0.crate",
        type = "tar.gz",
        sha256 = "77d416b86801d23dde1aa643023b775c3a462efc0ed96443add11546cdf1dca8",
        strip_prefix = "rand_xorshift-0.2.0",
        build_file = Label("//cargo/remote:rand_xorshift-0.2.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rawpointer__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rawpointer/rawpointer-0.2.1.crate",
        type = "tar.gz",
        sha256 = "60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3",
        strip_prefix = "rawpointer-0.2.1",
        build_file = Label("//cargo/remote:rawpointer-0.2.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon__1_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rayon/rayon-1.3.1.crate",
        type = "tar.gz",
        strip_prefix = "rayon-1.3.1",
        build_file = Label("//cargo/remote:rayon-1.3.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon_core__1_8_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rayon-core/rayon-core-1.8.1.crate",
        type = "tar.gz",
        strip_prefix = "rayon-core-1.8.1",
        build_file = Label("//cargo/remote:rayon-core-1.8.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_3_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/regex/regex-1.3.7.crate",
        type = "tar.gz",
        sha256 = "a6020f034922e3194c711b82a627453881bc4682166cabb07134a10c26ba7692",
        strip_prefix = "regex-1.3.7",
        build_file = Label("//cargo/remote:regex-1.3.7.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_automata__0_1_9",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/regex-automata/regex-automata-0.1.9.crate",
        type = "tar.gz",
        sha256 = "ae1ded71d66a4a97f5e961fd0cb25a5f366a42a41570d16a763a69c092c26ae4",
        strip_prefix = "regex-automata-0.1.9",
        build_file = Label("//cargo/remote:regex-automata-0.1.9.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/regex-syntax/regex-syntax-0.6.17.crate",
        type = "tar.gz",
        sha256 = "7fe5bd57d1d7414c6b5ed48563a2c855d995ff777729dcd91c369ec7fea395ae",
        strip_prefix = "regex-syntax-0.6.17",
        build_file = Label("//cargo/remote:regex-syntax-0.6.17.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_version__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustc_version/rustc_version-0.2.3.crate",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//cargo/remote:rustc_version-0.2.3.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ryu__1_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ryu/ryu-1.0.4.crate",
        type = "tar.gz",
        sha256 = "ed3d612bc64430efeb3f7ee6ef26d590dce0c43249217bddc62112540c7941e1",
        strip_prefix = "ryu-1.0.4",
        build_file = Label("//cargo/remote:ryu-1.0.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__same_file__1_0_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/same-file/same-file-1.0.6.crate",
        type = "tar.gz",
        sha256 = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502",
        strip_prefix = "same-file-1.0.6",
        build_file = Label("//cargo/remote:same-file-1.0.6.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/scopeguard/scopeguard-1.1.0.crate",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//cargo/remote:scopeguard-1.1.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/semver/semver-0.9.0.crate",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//cargo/remote:semver-0.9.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver_parser__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/semver-parser/semver-parser-0.7.0.crate",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//cargo/remote:semver-parser-0.7.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_110",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde/serde-1.0.110.crate",
        type = "tar.gz",
        sha256 = "99e7b308464d16b56eba9964e4972a3eee817760ab60d88c3f86e1fecb08204c",
        strip_prefix = "serde-1.0.110",
        build_file = Label("//cargo/remote:serde-1.0.110.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_110",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_derive/serde_derive-1.0.110.crate",
        type = "tar.gz",
        sha256 = "818fbf6bfa9a42d3bfcaca148547aa00c7b915bec71d1757aa2d44ca68771984",
        strip_prefix = "serde_derive-1.0.110",
        build_file = Label("//cargo/remote:serde_derive-1.0.110.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_json__1_0_53",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_json/serde_json-1.0.53.crate",
        type = "tar.gz",
        sha256 = "993948e75b189211a9b31a7528f950c6adc21f9720b6438ff80a7fa2f864cea2",
        strip_prefix = "serde_json-1.0.53",
        build_file = Label("//cargo/remote:serde_json-1.0.53.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/smallvec/smallvec-1.4.0.crate",
        type = "tar.gz",
        sha256 = "c7cb5678e1615754284ec264d9bb5b4c27d2018577fd90ac0ceb578591ed5ee4",
        strip_prefix = "smallvec-1.4.0",
        build_file = Label("//cargo/remote:smallvec-1.4.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sprs__0_7_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/sprs/sprs-0.7.1.crate",
        type = "tar.gz",
        sha256 = "ec63571489873d4506683915840eeb1bb16b3198ee4894cc6f2fe3013d505e56",
        strip_prefix = "sprs-0.7.1",
        build_file = Label("//cargo/remote:sprs-0.7.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__subtle__1_0_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/subtle/subtle-1.0.0.crate",
        type = "tar.gz",
        sha256 = "2d67a5a62ba6e01cb2192ff309324cb4875d0c451d55fe2319433abe7a05a8ee",
        strip_prefix = "subtle-1.0.0",
        build_file = Label("//cargo/remote:subtle-1.0.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__0_15_44",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.44.crate",
        type = "tar.gz",
        sha256 = "9ca4b3b69a77cbe1ffc9e198781b7acb0c7365a883670e8f1c1bc66fba79a5c5",
        strip_prefix = "syn-0.15.44",
        build_file = Label("//cargo/remote:syn-0.15.44.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-1.0.17.crate",
        type = "tar.gz",
        strip_prefix = "syn-1.0.17",
        build_file = Label("//cargo/remote:syn-1.0.17.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__textwrap__0_11_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/textwrap/textwrap-0.11.0.crate",
        type = "tar.gz",
        sha256 = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060",
        strip_prefix = "textwrap-0.11.0",
        build_file = Label("//cargo/remote:textwrap-0.11.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinytemplate__1_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tinytemplate/tinytemplate-1.0.4.crate",
        type = "tar.gz",
        sha256 = "45e4bc5ac99433e0dcb8b9f309dd271a165ae37dde129b9e0ce1bfdd8bfe4891",
        strip_prefix = "tinytemplate-1.0.4",
        build_file = Label("//cargo/remote:tinytemplate-1.0.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_12_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/typenum/typenum-1.12.0.crate",
        type = "tar.gz",
        sha256 = "373c8a200f9e67a0c95e62a4f52fbf80c23b4381c05a17845531982fa99e6b33",
        strip_prefix = "typenum-1.12.0",
        build_file = Label("//cargo/remote:typenum-1.12.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_width__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-width/unicode-width-0.1.7.crate",
        type = "tar.gz",
        sha256 = "caaa9d531767d1ff2150b9332433f32a24622147e5ebb1f26409d5da67afd479",
        strip_prefix = "unicode-width-0.1.7",
        build_file = Label("//cargo/remote:unicode-width-0.1.7.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        sha256 = "fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//cargo/remote:unicode-xid-0.1.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.2.0.crate",
        type = "tar.gz",
        sha256 = "826e7639553986605ec5979c7dd957c7895e93eabed50ab2ffa7f6128a75097c",
        strip_prefix = "unicode-xid-0.2.0",
        build_file = Label("//cargo/remote:unicode-xid-0.2.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unroll__0_1_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unroll/unroll-0.1.4.crate",
        type = "tar.gz",
        sha256 = "85890b49d9724df33edc575c4bacd5b0081977da22c4c4984d0c62ec44ed6e09",
        strip_prefix = "unroll-0.1.4",
        build_file = Label("//cargo/remote:unroll-0.1.4.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__walkdir__2_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/walkdir/walkdir-2.3.1.crate",
        type = "tar.gz",
        sha256 = "777182bc735b6424e1a57516d35ed72cb8019d85c8c9bf536dccb3445c1a2f7d",
        strip_prefix = "walkdir-2.3.1",
        build_file = Label("//cargo/remote:walkdir-2.3.1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasi/wasi-0.9.0+wasi-snapshot-preview1.crate",
        type = "tar.gz",
        sha256 = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//cargo/remote:wasi-0.9.0+wasi-snapshot-preview1.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen__0_2_62",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen/wasm-bindgen-0.2.62.crate",
        type = "tar.gz",
        sha256 = "e3c7d40d09cdbf0f4895ae58cf57d92e1e57a9dd8ed2e8390514b54a47cc5551",
        strip_prefix = "wasm-bindgen-0.2.62",
        build_file = Label("//cargo/remote:wasm-bindgen-0.2.62.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_backend__0_2_62",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-backend/wasm-bindgen-backend-0.2.62.crate",
        type = "tar.gz",
        sha256 = "c3972e137ebf830900db522d6c8fd74d1900dcfc733462e9a12e942b00b4ac94",
        strip_prefix = "wasm-bindgen-backend-0.2.62",
        build_file = Label("//cargo/remote:wasm-bindgen-backend-0.2.62.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro__0_2_62",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro/wasm-bindgen-macro-0.2.62.crate",
        type = "tar.gz",
        sha256 = "2cd85aa2c579e8892442954685f0d801f9129de24fa2136b2c6a539c76b65776",
        strip_prefix = "wasm-bindgen-macro-0.2.62",
        build_file = Label("//cargo/remote:wasm-bindgen-macro-0.2.62.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro_support__0_2_62",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro-support/wasm-bindgen-macro-support-0.2.62.crate",
        type = "tar.gz",
        sha256 = "8eb197bd3a47553334907ffd2f16507b4f4f01bbec3ac921a7719e0decdfe72a",
        strip_prefix = "wasm-bindgen-macro-support-0.2.62",
        build_file = Label("//cargo/remote:wasm-bindgen-macro-support-0.2.62.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_shared__0_2_62",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-shared/wasm-bindgen-shared-0.2.62.crate",
        type = "tar.gz",
        sha256 = "a91c2916119c17a8e316507afaaa2dd94b47646048014bbdf6bef098c1bb58ad",
        strip_prefix = "wasm-bindgen-shared-0.2.62",
        build_file = Label("//cargo/remote:wasm-bindgen-shared-0.2.62.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__web_sys__0_3_39",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/web-sys/web-sys-0.3.39.crate",
        type = "tar.gz",
        sha256 = "8bc359e5dd3b46cb9687a051d50a2fdd228e4ba7cf6fcf861a5365c3d671a642",
        strip_prefix = "web-sys-0.3.39",
        build_file = Label("//cargo/remote:web-sys-0.3.39.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.3.8.crate",
        type = "tar.gz",
        sha256 = "8093091eeb260906a183e6ae1abdba2ef5ef2257a21801128899c3fc699229c6",
        strip_prefix = "winapi-0.3.8",
        build_file = Label("//cargo/remote:winapi-0.3.8.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//cargo/remote:winapi-i686-pc-windows-gnu-0.4.0.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-util/winapi-util-0.1.5.crate",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//cargo/remote:winapi-util-0.1.5.BUILD.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//cargo/remote:winapi-x86_64-pc-windows-gnu-0.4.0.BUILD.bazel"),
    )
