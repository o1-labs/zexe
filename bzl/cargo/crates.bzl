"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def zexe_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__alga__0_9_3",
        url = "https://crates.io/api/v1/crates/alga/0.9.3/download",
        type = "tar.gz",
        sha256 = "4f823d037a7ec6ea2197046bafd4ae150e6bc36f9ca347404f46a46823fa84f2",
        strip_prefix = "alga-0.9.3",
        build_file = Label("//bzl/cargo/remote:BUILD.alga-0.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__approx__0_3_2",
        url = "https://crates.io/api/v1/crates/approx/0.3.2/download",
        type = "tar.gz",
        sha256 = "f0e60b75072ecd4168020818c0107f2857bb6c4e64252d8d3983f6263b40a5c3",
        strip_prefix = "approx-0.3.2",
        build_file = Label("//bzl/cargo/remote:BUILD.approx-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bzl/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__0_1_7",
        url = "https://crates.io/api/v1/crates/autocfg/0.1.7/download",
        type = "tar.gz",
        sha256 = "1d49d90015b3c36167a20fe2810c5cd875ad504b39cff3d4eae7977e6b7c1cb2",
        strip_prefix = "autocfg-0.1.7",
        build_file = Label("//bzl/cargo/remote:BUILD.autocfg-0.1.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bzl/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bzl/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__blake2__0_8_1",
        url = "https://crates.io/api/v1/crates/blake2/0.8.1/download",
        type = "tar.gz",
        sha256 = "94cb07b0da6a73955f8fb85d24c466778e70cda767a568229b104f0264089330",
        strip_prefix = "blake2-0.8.1",
        build_file = Label("//bzl/cargo/remote:BUILD.blake2-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bstr__0_2_14",
        url = "https://crates.io/api/v1/crates/bstr/0.2.14/download",
        type = "tar.gz",
        sha256 = "473fc6b38233f9af7baa94fb5852dca389e3d95b8e21c8e3719301462c5d9faf",
        strip_prefix = "bstr-0.2.14",
        build_file = Label("//bzl/cargo/remote:BUILD.bstr-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bumpalo__3_4_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.4.0/download",
        type = "tar.gz",
        sha256 = "2e8c087f005730276d1096a652e92a8bacee2e2472bcc9715a74d2bec38b5820",
        strip_prefix = "bumpalo-3.4.0",
        build_file = Label("//bzl/cargo/remote:BUILD.bumpalo-3.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byte_tools__0_3_1",
        url = "https://crates.io/api/v1/crates/byte-tools/0.3.1/download",
        type = "tar.gz",
        sha256 = "e3b5ca7a04898ad4bcd41c90c5285445ff5b791899bb1b0abdd2a2aa791211d7",
        strip_prefix = "byte-tools-0.3.1",
        build_file = Label("//bzl/cargo/remote:BUILD.byte-tools-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_3_4",
        url = "https://crates.io/api/v1/crates/byteorder/1.3.4/download",
        type = "tar.gz",
        sha256 = "08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//bzl/cargo/remote:BUILD.byteorder-1.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cast__0_2_3",
        url = "https://crates.io/api/v1/crates/cast/0.2.3/download",
        type = "tar.gz",
        sha256 = "4b9434b9a5aa1450faa3f9cb14ea0e8c53bb5d2b3c1bfd1ab4fc03e9f33fbfb0",
        strip_prefix = "cast-0.2.3",
        build_file = Label("//bzl/cargo/remote:BUILD.cast-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//bzl/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bzl/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap__2_33_3",
        url = "https://crates.io/api/v1/crates/clap/2.33.3/download",
        type = "tar.gz",
        sha256 = "37e58ac78573c40708d45522f0d80fa2f01cc4f9b4e2bf749807255454312002",
        strip_prefix = "clap-2.33.3",
        build_file = Label("//bzl/cargo/remote:BUILD.clap-2.33.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__colored__2_0_0",
        url = "https://crates.io/api/v1/crates/colored/2.0.0/download",
        type = "tar.gz",
        sha256 = "b3616f750b84d8f0de8a58bda93e08e2a81ad3f523089b05f1dffecab48c6cbd",
        strip_prefix = "colored-2.0.0",
        build_file = Label("//bzl/cargo/remote:BUILD.colored-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__const_fn__0_4_3",
        url = "https://crates.io/api/v1/crates/const_fn/0.4.3/download",
        type = "tar.gz",
        sha256 = "c478836e029dcef17fb47c89023448c64f781a046e0300e257ad8225ae59afab",
        strip_prefix = "const_fn-0.4.3",
        build_file = Label("//bzl/cargo/remote:BUILD.const_fn-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__criterion__0_3_3",
        url = "https://crates.io/api/v1/crates/criterion/0.3.3/download",
        type = "tar.gz",
        sha256 = "70daa7ceec6cf143990669a04c7df13391d55fb27bd4079d252fca774ba244d8",
        strip_prefix = "criterion-0.3.3",
        build_file = Label("//bzl/cargo/remote:BUILD.criterion-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__criterion_plot__0_4_3",
        url = "https://crates.io/api/v1/crates/criterion-plot/0.4.3/download",
        type = "tar.gz",
        sha256 = "e022feadec601fba1649cfa83586381a4ad31c6bf3a9ab7d408118b05dd9889d",
        strip_prefix = "criterion-plot-0.4.3",
        build_file = Label("//bzl/cargo/remote:BUILD.criterion-plot-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_channel__0_5_0",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.0/download",
        type = "tar.gz",
        sha256 = "dca26ee1f8d361640700bde38b2c37d8c22b3ce2d360e1fc1c74ea4b0aa7d775",
        strip_prefix = "crossbeam-channel-0.5.0",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-channel-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_deque__0_7_3",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.7.3/download",
        type = "tar.gz",
        sha256 = "9f02af974daeee82218205558e51ec8768b48cf524bd01d550abe5573a608285",
        strip_prefix = "crossbeam-deque-0.7.3",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-deque-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_deque__0_8_0",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.0/download",
        type = "tar.gz",
        sha256 = "94af6efb46fef72616855b036a624cf27ba656ffc9be1b9a3c931cfc7749a9a9",
        strip_prefix = "crossbeam-deque-0.8.0",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-deque-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_epoch__0_8_2",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.8.2/download",
        type = "tar.gz",
        sha256 = "058ed274caafc1f60c4997b5fc07bf7dc7cca454af7c6e81edffe5f33f70dace",
        strip_prefix = "crossbeam-epoch-0.8.2",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-epoch-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_epoch__0_9_0",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.0/download",
        type = "tar.gz",
        sha256 = "ec0f606a85340376eef0d6d8fec399e6d4a544d648386c6645eb6d0653b27d9f",
        strip_prefix = "crossbeam-epoch-0.9.0",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-epoch-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_7_2",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.7.2/download",
        type = "tar.gz",
        sha256 = "c3c7c73a2d1e9fc0886a08b93e98eb643461230d5f1925e4036204d5f2e261a8",
        strip_prefix = "crossbeam-utils-0.7.2",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-utils-0.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_8_0",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.0/download",
        type = "tar.gz",
        sha256 = "ec91540d98355f690a86367e566ecad2e9e579f230230eb7c21398372be73ea5",
        strip_prefix = "crossbeam-utils-0.8.0",
        build_file = Label("//bzl/cargo/remote:BUILD.crossbeam-utils-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crypto_mac__0_7_0",
        url = "https://crates.io/api/v1/crates/crypto-mac/0.7.0/download",
        type = "tar.gz",
        sha256 = "4434400df11d95d556bac068ddfedd482915eb18fe8bea89bc80b6e4b1c179e5",
        strip_prefix = "crypto-mac-0.7.0",
        build_file = Label("//bzl/cargo/remote:BUILD.crypto-mac-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__csv__1_1_4",
        url = "https://crates.io/api/v1/crates/csv/1.1.4/download",
        type = "tar.gz",
        sha256 = "fc4666154fd004af3fd6f1da2e81a96fd5a81927fe8ddb6ecc79e2aa6e138b54",
        strip_prefix = "csv-1.1.4",
        build_file = Label("//bzl/cargo/remote:BUILD.csv-1.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__csv_core__0_1_10",
        url = "https://crates.io/api/v1/crates/csv-core/0.1.10/download",
        type = "tar.gz",
        sha256 = "2b2466559f260f48ad25fe6317b3c8dac77b5bdb5763ac7d9d6103530663bc90",
        strip_prefix = "csv-core-0.1.10",
        build_file = Label("//bzl/cargo/remote:BUILD.csv-core-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__derivative__2_1_1",
        url = "https://crates.io/api/v1/crates/derivative/2.1.1/download",
        type = "tar.gz",
        sha256 = "cb582b60359da160a9477ee80f15c8d784c477e69c217ef2cdd4169c24ea380f",
        strip_prefix = "derivative-2.1.1",
        build_file = Label("//bzl/cargo/remote:BUILD.derivative-2.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_8_1",
        url = "https://crates.io/api/v1/crates/digest/0.8.1/download",
        type = "tar.gz",
        sha256 = "f3d0c8c8752312f9713efd397ff63acb9f85585afbf179282e720e7704954dd5",
        strip_prefix = "digest-0.8.1",
        build_file = Label("//bzl/cargo/remote:BUILD.digest-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bzl/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__endian_type__0_1_2",
        url = "https://crates.io/api/v1/crates/endian-type/0.1.2/download",
        type = "tar.gz",
        sha256 = "c34f04666d835ff5d62e058c3995147c06f42fe86ff053337632bca83e42702d",
        strip_prefix = "endian-type-0.1.2",
        build_file = Label("//bzl/cargo/remote:BUILD.endian-type-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_12_3",
        url = "https://crates.io/api/v1/crates/generic-array/0.12.3/download",
        type = "tar.gz",
        sha256 = "c68f0274ae0e023facc3c97b2e00f076be70e254bc851d972503b328db79b2ec",
        strip_prefix = "generic-array-0.12.3",
        build_file = Label("//bzl/cargo/remote:BUILD.generic-array-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_15",
        url = "https://crates.io/api/v1/crates/getrandom/0.1.15/download",
        type = "tar.gz",
        sha256 = "fc587bc0ec293155d5bfa6b9891ec18a1e330c234f896ea47fbada4cadbe47e6",
        strip_prefix = "getrandom-0.1.15",
        build_file = Label("//bzl/cargo/remote:BUILD.getrandom-0.1.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__half__1_6_0",
        url = "https://crates.io/api/v1/crates/half/1.6.0/download",
        type = "tar.gz",
        sha256 = "d36fab90f82edc3c747f9d438e06cf0a491055896f2a279638bb5beed6c40177",
        strip_prefix = "half-1.6.0",
        build_file = Label("//bzl/cargo/remote:BUILD.half-1.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_17",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.17/download",
        type = "tar.gz",
        sha256 = "5aca5565f760fb5b220e499d72710ed156fdb74e631659e99377d9ebfbd13ae8",
        strip_prefix = "hermit-abi-0.1.17",
        build_file = Label("//bzl/cargo/remote:BUILD.hermit-abi-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itertools__0_9_0",
        url = "https://crates.io/api/v1/crates/itertools/0.9.0/download",
        type = "tar.gz",
        sha256 = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//bzl/cargo/remote:BUILD.itertools-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__0_4_6",
        url = "https://crates.io/api/v1/crates/itoa/0.4.6/download",
        type = "tar.gz",
        sha256 = "dc6f3ad7b9d11a0c00842ff8de1b60ee58661048eb8049ed33c73594f359d7e6",
        strip_prefix = "itoa-0.4.6",
        build_file = Label("//bzl/cargo/remote:BUILD.itoa-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__js_sys__0_3_39",
        url = "https://crates.io/api/v1/crates/js-sys/0.3.39/download",
        type = "tar.gz",
        sha256 = "fa5a448de267e7358beaf4a5d849518fe9a0c13fce7afd44b06e68550e5562a7",
        strip_prefix = "js-sys-0.3.39",
        build_file = Label("//bzl/cargo/remote:BUILD.js-sys-0.3.39.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bzl/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_80",
        url = "https://crates.io/api/v1/crates/libc/0.2.80/download",
        type = "tar.gz",
        sha256 = "4d58d1b70b004888f764dfbf6a26a3b0342a1632d33968e4a179d8011c760614",
        strip_prefix = "libc-0.2.80",
        build_file = Label("//bzl/cargo/remote:BUILD.libc-0.2.80.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libm__0_2_1",
        url = "https://crates.io/api/v1/crates/libm/0.2.1/download",
        type = "tar.gz",
        sha256 = "c7d73b3f436185384286bd8098d17ec07c9a7d2388a6599f824d8502b529702a",
        strip_prefix = "libm-0.2.1",
        build_file = Label("//bzl/cargo/remote:BUILD.libm-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_11",
        url = "https://crates.io/api/v1/crates/log/0.4.11/download",
        type = "tar.gz",
        sha256 = "4fabed175da42fed1fa0746b0ea71f412aa9d35e76e95e59b192c64b9dc2bf8b",
        strip_prefix = "log-0.4.11",
        build_file = Label("//bzl/cargo/remote:BUILD.log-0.4.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matrixmultiply__0_2_3",
        url = "https://crates.io/api/v1/crates/matrixmultiply/0.2.3/download",
        type = "tar.gz",
        sha256 = "d4f7ec66360130972f34830bfad9ef05c6610a43938a467bcc9ab9369ab3478f",
        strip_prefix = "matrixmultiply-0.2.3",
        build_file = Label("//bzl/cargo/remote:BUILD.matrixmultiply-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__maybe_uninit__2_0_0",
        url = "https://crates.io/api/v1/crates/maybe-uninit/2.0.0/download",
        type = "tar.gz",
        sha256 = "60302e4db3a61da70c0cb7991976248362f30319e88850c487b9b95bbf059e00",
        strip_prefix = "maybe-uninit-2.0.0",
        build_file = Label("//bzl/cargo/remote:BUILD.maybe-uninit-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        sha256 = "0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//bzl/cargo/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_5_6",
        url = "https://crates.io/api/v1/crates/memoffset/0.5.6/download",
        type = "tar.gz",
        sha256 = "043175f069eda7b85febe4a74abbaeff828d9f8b448515d3151a14a3542811aa",
        strip_prefix = "memoffset-0.5.6",
        build_file = Label("//bzl/cargo/remote:BUILD.memoffset-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ndarray__0_13_1",
        url = "https://crates.io/api/v1/crates/ndarray/0.13.1/download",
        type = "tar.gz",
        sha256 = "ac06db03ec2f46ee0ecdca1a1c34a99c0d188a0d83439b84bf0cb4b386e4ab09",
        strip_prefix = "ndarray-0.13.1",
        build_file = Label("//bzl/cargo/remote:BUILD.ndarray-0.13.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__nibble_vec__0_0_4",
        url = "https://crates.io/api/v1/crates/nibble_vec/0.0.4/download",
        type = "tar.gz",
        sha256 = "c8d77f3db4bce033f4d04db08079b2ef1c3d02b44e86f25d08886fafa7756ffa",
        strip_prefix = "nibble_vec-0.0.4",
        build_file = Label("//bzl/cargo/remote:BUILD.nibble_vec-0.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_bigint__0_2_3",
        url = "https://crates.io/api/v1/crates/num-bigint/0.2.3/download",
        type = "tar.gz",
        sha256 = "f9c3f34cdd24f334cb265d9bf8bfa8a241920d026916785747a92f0e55541a1a",
        strip_prefix = "num-bigint-0.2.3",
        build_file = Label("//bzl/cargo/remote:BUILD.num-bigint-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_complex__0_2_4",
        url = "https://crates.io/api/v1/crates/num-complex/0.2.4/download",
        type = "tar.gz",
        sha256 = "b6b19411a9719e753aff12e5187b74d60d3dc449ec3f4dc21e3989c3f554bc95",
        strip_prefix = "num-complex-0.2.4",
        build_file = Label("//bzl/cargo/remote:BUILD.num-complex-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_integer__0_1_44",
        url = "https://crates.io/api/v1/crates/num-integer/0.1.44/download",
        type = "tar.gz",
        sha256 = "d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db",
        strip_prefix = "num-integer-0.1.44",
        build_file = Label("//bzl/cargo/remote:BUILD.num-integer-0.1.44.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_1_43",
        url = "https://crates.io/api/v1/crates/num-traits/0.1.43/download",
        type = "tar.gz",
        sha256 = "92e5113e9fd4cc14ded8e499429f396a20f98c772a47cc8622a736e1ec843c31",
        strip_prefix = "num-traits-0.1.43",
        build_file = Label("//bzl/cargo/remote:BUILD.num-traits-0.1.43.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_2_11",
        url = "https://crates.io/api/v1/crates/num-traits/0.2.11/download",
        type = "tar.gz",
        sha256 = "c62be47e61d1842b9170f0fdeec8eba98e60e90e5446449a0545e5152acd7096",
        strip_prefix = "num-traits-0.2.11",
        build_file = Label("//bzl/cargo/remote:BUILD.num-traits-0.2.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_13_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.13.0/download",
        type = "tar.gz",
        sha256 = "05499f3756671c15885fee9034446956fff3f243d6077b91e5767df161f766b3",
        strip_prefix = "num_cpus-1.13.0",
        build_file = Label("//bzl/cargo/remote:BUILD.num_cpus-1.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__oorandom__11_1_2",
        url = "https://crates.io/api/v1/crates/oorandom/11.1.2/download",
        type = "tar.gz",
        sha256 = "a170cebd8021a008ea92e4db85a72f80b35df514ec664b296fdcbb654eac0b2c",
        strip_prefix = "oorandom-11.1.2",
        build_file = Label("//bzl/cargo/remote:BUILD.oorandom-11.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_2_3",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.2.3/download",
        type = "tar.gz",
        sha256 = "2839e79665f131bdb5782e51f2c6c9599c133c6098982a54c794358bf432529c",
        strip_prefix = "opaque-debug-0.2.3",
        build_file = Label("//bzl/cargo/remote:BUILD.opaque-debug-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__paste__0_1_18",
        url = "https://crates.io/api/v1/crates/paste/0.1.18/download",
        type = "tar.gz",
        sha256 = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880",
        strip_prefix = "paste-0.1.18",
        build_file = Label("//bzl/cargo/remote:BUILD.paste-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__paste_impl__0_1_18",
        url = "https://crates.io/api/v1/crates/paste-impl/0.1.18/download",
        type = "tar.gz",
        sha256 = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6",
        strip_prefix = "paste-impl-0.1.18",
        build_file = Label("//bzl/cargo/remote:BUILD.paste-impl-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__plotters__0_2_15",
        url = "https://crates.io/api/v1/crates/plotters/0.2.15/download",
        type = "tar.gz",
        sha256 = "0d1685fbe7beba33de0330629da9d955ac75bd54f33d7b79f9a895590124f6bb",
        strip_prefix = "plotters-0.2.15",
        build_file = Label("//bzl/cargo/remote:BUILD.plotters-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ppv_lite86__0_2_10",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.10/download",
        type = "tar.gz",
        sha256 = "ac74c624d6b2d21f425f752262f42188365d7b8ff1aff74c82e45136510a4857",
        strip_prefix = "ppv-lite86-0.2.10",
        build_file = Label("//bzl/cargo/remote:BUILD.ppv-lite86-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_hack__0_5_19",
        url = "https://crates.io/api/v1/crates/proc-macro-hack/0.5.19/download",
        type = "tar.gz",
        sha256 = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5",
        strip_prefix = "proc-macro-hack-0.5.19",
        build_file = Label("//bzl/cargo/remote:BUILD.proc-macro-hack-0.5.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__0_4_30",
        url = "https://crates.io/api/v1/crates/proc-macro2/0.4.30/download",
        type = "tar.gz",
        sha256 = "cf3d2011ab5c909338f7887f4fc896d35932e29146c12c8d01da6b22a80ba759",
        strip_prefix = "proc-macro2-0.4.30",
        build_file = Label("//bzl/cargo/remote:BUILD.proc-macro2-0.4.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_17",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.17/download",
        type = "tar.gz",
        sha256 = "1502d12e458c49a4c9cbff560d0fe0060c252bc29799ed94ca2ed4bb665a0101",
        strip_prefix = "proc-macro2-1.0.17",
        build_file = Label("//bzl/cargo/remote:BUILD.proc-macro2-1.0.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__0_6_13",
        url = "https://crates.io/api/v1/crates/quote/0.6.13/download",
        type = "tar.gz",
        sha256 = "6ce23b6b870e8f94f81fb0a363d65d86675884b34a09043c81e5562f11c1f8e1",
        strip_prefix = "quote-0.6.13",
        build_file = Label("//bzl/cargo/remote:BUILD.quote-0.6.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_6",
        url = "https://crates.io/api/v1/crates/quote/1.0.6/download",
        type = "tar.gz",
        sha256 = "54a21852a652ad6f610c9510194f398ff6f8692e334fd1145fed931f7fbe44ea",
        strip_prefix = "quote-1.0.6",
        build_file = Label("//bzl/cargo/remote:BUILD.quote-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__radix_trie__0_1_6",
        url = "https://crates.io/api/v1/crates/radix_trie/0.1.6/download",
        type = "tar.gz",
        sha256 = "3d3681b28cd95acfb0560ea9441f82d6a4504fa3b15b97bd7b6e952131820e95",
        strip_prefix = "radix_trie-0.1.6",
        build_file = Label("//bzl/cargo/remote:BUILD.radix_trie-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_7_0",
        url = "https://crates.io/api/v1/crates/rand/0.7.0/download",
        type = "tar.gz",
        sha256 = "d47eab0e83d9693d40f825f86948aa16eff6750ead4bdffc4ab95b8b3a7f052c",
        strip_prefix = "rand-0.7.0",
        build_file = Label("//bzl/cargo/remote:BUILD.rand-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_2_2",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.2.2/download",
        type = "tar.gz",
        sha256 = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402",
        strip_prefix = "rand_chacha-0.2.2",
        build_file = Label("//bzl/cargo/remote:BUILD.rand_chacha-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_5_1",
        url = "https://crates.io/api/v1/crates/rand_core/0.5.1/download",
        type = "tar.gz",
        sha256 = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19",
        strip_prefix = "rand_core-0.5.1",
        build_file = Label("//bzl/cargo/remote:BUILD.rand_core-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_2_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.2.0/download",
        type = "tar.gz",
        sha256 = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c",
        strip_prefix = "rand_hc-0.2.0",
        build_file = Label("//bzl/cargo/remote:BUILD.rand_hc-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_xorshift__0_2_0",
        url = "https://crates.io/api/v1/crates/rand_xorshift/0.2.0/download",
        type = "tar.gz",
        sha256 = "77d416b86801d23dde1aa643023b775c3a462efc0ed96443add11546cdf1dca8",
        strip_prefix = "rand_xorshift-0.2.0",
        build_file = Label("//bzl/cargo/remote:BUILD.rand_xorshift-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rawpointer__0_2_1",
        url = "https://crates.io/api/v1/crates/rawpointer/0.2.1/download",
        type = "tar.gz",
        sha256 = "60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3",
        strip_prefix = "rawpointer-0.2.1",
        build_file = Label("//bzl/cargo/remote:BUILD.rawpointer-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon__1_3_1",
        url = "https://crates.io/api/v1/crates/rayon/1.3.1/download",
        type = "tar.gz",
        sha256 = "62f02856753d04e03e26929f820d0a0a337ebe71f849801eea335d464b349080",
        strip_prefix = "rayon-1.3.1",
        build_file = Label("//bzl/cargo/remote:BUILD.rayon-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon_core__1_9_0",
        url = "https://crates.io/api/v1/crates/rayon-core/1.9.0/download",
        type = "tar.gz",
        sha256 = "9ab346ac5921dc62ffa9f89b7a773907511cdfa5490c572ae9be1be33e8afa4a",
        strip_prefix = "rayon-core-1.9.0",
        build_file = Label("//bzl/cargo/remote:BUILD.rayon-core-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_4_2",
        url = "https://crates.io/api/v1/crates/regex/1.4.2/download",
        type = "tar.gz",
        sha256 = "38cf2c13ed4745de91a5eb834e11c00bcc3709e773173b2ce4c56c9fbde04b9c",
        strip_prefix = "regex-1.4.2",
        build_file = Label("//bzl/cargo/remote:BUILD.regex-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_automata__0_1_9",
        url = "https://crates.io/api/v1/crates/regex-automata/0.1.9/download",
        type = "tar.gz",
        sha256 = "ae1ded71d66a4a97f5e961fd0cb25a5f366a42a41570d16a763a69c092c26ae4",
        strip_prefix = "regex-automata-0.1.9",
        build_file = Label("//bzl/cargo/remote:BUILD.regex-automata-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_21",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.21/download",
        type = "tar.gz",
        sha256 = "3b181ba2dcf07aaccad5448e8ead58db5b742cf85dfe035e2227f137a539a189",
        strip_prefix = "regex-syntax-0.6.21",
        build_file = Label("//bzl/cargo/remote:BUILD.regex-syntax-0.6.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//bzl/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ryu__1_0_5",
        url = "https://crates.io/api/v1/crates/ryu/1.0.5/download",
        type = "tar.gz",
        sha256 = "71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e",
        strip_prefix = "ryu-1.0.5",
        build_file = Label("//bzl/cargo/remote:BUILD.ryu-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__same_file__1_0_6",
        url = "https://crates.io/api/v1/crates/same-file/1.0.6/download",
        type = "tar.gz",
        sha256 = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502",
        strip_prefix = "same-file-1.0.6",
        build_file = Label("//bzl/cargo/remote:BUILD.same-file-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//bzl/cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//bzl/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//bzl/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_117",
        url = "https://crates.io/api/v1/crates/serde/1.0.117/download",
        type = "tar.gz",
        sha256 = "b88fa983de7720629c9387e9f517353ed404164b1e482c970a90c1a4aaf7dc1a",
        strip_prefix = "serde-1.0.117",
        build_file = Label("//bzl/cargo/remote:BUILD.serde-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_cbor__0_11_1",
        url = "https://crates.io/api/v1/crates/serde_cbor/0.11.1/download",
        type = "tar.gz",
        sha256 = "1e18acfa2f90e8b735b2836ab8d538de304cbb6729a7360729ea5a895d15a622",
        strip_prefix = "serde_cbor-0.11.1",
        build_file = Label("//bzl/cargo/remote:BUILD.serde_cbor-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_113",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.113/download",
        type = "tar.gz",
        sha256 = "93c5eaa17d0954cb481cdcfffe9d84fcfa7a1a9f2349271e678677be4c26ae31",
        strip_prefix = "serde_derive-1.0.113",
        build_file = Label("//bzl/cargo/remote:BUILD.serde_derive-1.0.113.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_json__1_0_59",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.59/download",
        type = "tar.gz",
        sha256 = "dcac07dbffa1c65e7f816ab9eba78eb142c6d44410f4eeba1e26e4f5dfa56b95",
        strip_prefix = "serde_json-1.0.59",
        build_file = Label("//bzl/cargo/remote:BUILD.serde_json-1.0.59.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_4_2",
        url = "https://crates.io/api/v1/crates/smallvec/1.4.2/download",
        type = "tar.gz",
        sha256 = "fbee7696b84bbf3d89a1c2eccff0850e3047ed46bfcd2e92c29a2d074d57e252",
        strip_prefix = "smallvec-1.4.2",
        build_file = Label("//bzl/cargo/remote:BUILD.smallvec-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sprs__0_7_1",
        url = "https://crates.io/api/v1/crates/sprs/0.7.1/download",
        type = "tar.gz",
        sha256 = "ec63571489873d4506683915840eeb1bb16b3198ee4894cc6f2fe3013d505e56",
        strip_prefix = "sprs-0.7.1",
        build_file = Label("//bzl/cargo/remote:BUILD.sprs-0.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__subtle__1_0_0",
        url = "https://crates.io/api/v1/crates/subtle/1.0.0/download",
        type = "tar.gz",
        sha256 = "2d67a5a62ba6e01cb2192ff309324cb4875d0c451d55fe2319433abe7a05a8ee",
        strip_prefix = "subtle-1.0.0",
        build_file = Label("//bzl/cargo/remote:BUILD.subtle-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__0_15_44",
        url = "https://crates.io/api/v1/crates/syn/0.15.44/download",
        type = "tar.gz",
        sha256 = "9ca4b3b69a77cbe1ffc9e198781b7acb0c7365a883670e8f1c1bc66fba79a5c5",
        strip_prefix = "syn-0.15.44",
        build_file = Label("//bzl/cargo/remote:BUILD.syn-0.15.44.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_17",
        url = "https://crates.io/api/v1/crates/syn/1.0.17/download",
        type = "tar.gz",
        sha256 = "0df0eb663f387145cab623dea85b09c2c5b4b0aef44e945d928e682fce71bb03",
        strip_prefix = "syn-1.0.17",
        build_file = Label("//bzl/cargo/remote:BUILD.syn-1.0.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__textwrap__0_11_0",
        url = "https://crates.io/api/v1/crates/textwrap/0.11.0/download",
        type = "tar.gz",
        sha256 = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060",
        strip_prefix = "textwrap-0.11.0",
        build_file = Label("//bzl/cargo/remote:BUILD.textwrap-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinytemplate__1_1_0",
        url = "https://crates.io/api/v1/crates/tinytemplate/1.1.0/download",
        type = "tar.gz",
        sha256 = "6d3dc76004a03cec1c5932bca4cdc2e39aaa798e3f82363dd94f9adf6098c12f",
        strip_prefix = "tinytemplate-1.1.0",
        build_file = Label("//bzl/cargo/remote:BUILD.tinytemplate-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_12_0",
        url = "https://crates.io/api/v1/crates/typenum/1.12.0/download",
        type = "tar.gz",
        sha256 = "373c8a200f9e67a0c95e62a4f52fbf80c23b4381c05a17845531982fa99e6b33",
        strip_prefix = "typenum-1.12.0",
        build_file = Label("//bzl/cargo/remote:BUILD.typenum-1.12.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_width__0_1_8",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.8/download",
        type = "tar.gz",
        sha256 = "9337591893a19b88d8d87f2cec1e73fad5cdfd10e5a6f349f498ad6ea2ffb1e3",
        strip_prefix = "unicode-width-0.1.8",
        build_file = Label("//bzl/cargo/remote:BUILD.unicode-width-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.1.0/download",
        type = "tar.gz",
        sha256 = "fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//bzl/cargo/remote:BUILD.unicode-xid-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        sha256 = "f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//bzl/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unroll__0_1_4",
        url = "https://crates.io/api/v1/crates/unroll/0.1.4/download",
        type = "tar.gz",
        sha256 = "85890b49d9724df33edc575c4bacd5b0081977da22c4c4984d0c62ec44ed6e09",
        strip_prefix = "unroll-0.1.4",
        build_file = Label("//bzl/cargo/remote:BUILD.unroll-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__walkdir__2_3_1",
        url = "https://crates.io/api/v1/crates/walkdir/2.3.1/download",
        type = "tar.gz",
        sha256 = "777182bc735b6424e1a57516d35ed72cb8019d85c8c9bf536dccb3445c1a2f7d",
        strip_prefix = "walkdir-2.3.1",
        build_file = Label("//bzl/cargo/remote:BUILD.walkdir-2.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.9.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//bzl/cargo/remote:BUILD.wasi-0.9.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen__0_2_62",
        url = "https://crates.io/api/v1/crates/wasm-bindgen/0.2.62/download",
        type = "tar.gz",
        sha256 = "e3c7d40d09cdbf0f4895ae58cf57d92e1e57a9dd8ed2e8390514b54a47cc5551",
        strip_prefix = "wasm-bindgen-0.2.62",
        build_file = Label("//bzl/cargo/remote:BUILD.wasm-bindgen-0.2.62.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_backend__0_2_62",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.62/download",
        type = "tar.gz",
        sha256 = "c3972e137ebf830900db522d6c8fd74d1900dcfc733462e9a12e942b00b4ac94",
        strip_prefix = "wasm-bindgen-backend-0.2.62",
        build_file = Label("//bzl/cargo/remote:BUILD.wasm-bindgen-backend-0.2.62.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro__0_2_62",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.62/download",
        type = "tar.gz",
        sha256 = "2cd85aa2c579e8892442954685f0d801f9129de24fa2136b2c6a539c76b65776",
        strip_prefix = "wasm-bindgen-macro-0.2.62",
        build_file = Label("//bzl/cargo/remote:BUILD.wasm-bindgen-macro-0.2.62.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro_support__0_2_62",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.62/download",
        type = "tar.gz",
        sha256 = "8eb197bd3a47553334907ffd2f16507b4f4f01bbec3ac921a7719e0decdfe72a",
        strip_prefix = "wasm-bindgen-macro-support-0.2.62",
        build_file = Label("//bzl/cargo/remote:BUILD.wasm-bindgen-macro-support-0.2.62.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_shared__0_2_62",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.62/download",
        type = "tar.gz",
        sha256 = "a91c2916119c17a8e316507afaaa2dd94b47646048014bbdf6bef098c1bb58ad",
        strip_prefix = "wasm-bindgen-shared-0.2.62",
        build_file = Label("//bzl/cargo/remote:BUILD.wasm-bindgen-shared-0.2.62.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__web_sys__0_3_39",
        url = "https://crates.io/api/v1/crates/web-sys/0.3.39/download",
        type = "tar.gz",
        sha256 = "8bc359e5dd3b46cb9687a051d50a2fdd228e4ba7cf6fcf861a5365c3d671a642",
        strip_prefix = "web-sys-0.3.39",
        build_file = Label("//bzl/cargo/remote:BUILD.web-sys-0.3.39.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bzl/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bzl/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bzl/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bzl/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )
