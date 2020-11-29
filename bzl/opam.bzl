opam = struct(
    opam_version = "2.0",
    pins = struct(
        install = True, # = default
        # paths = { },
        versions = {
            "ctypes"       : "0.17.1"
        }
    ),
    packages = {
        "base": "v0.12.0",
        "bisect_ppx": "2.4.1",
        "bisect_ppx.runtime": "2.4.1",
        "core_kernel": "v0.12.3",
        "ctypes": "0.17.1",
        "ctypes.foreign": "0.17.1", # opam: "0.4.0"; pkg for ctypes.foreign is ctypes-foreign
        "ctypes.stubs": "0.17.1",   # opam "0.4.0",
        "compiler-libs.common": "[distributed with Ocaml]", # "v0.11.0",
        "ppx_bin_prot": "v0.12.1",
        "ppx_let": "v0.12.0",
        "ppxlib": "0.8.1",
        "ppxlib.metaquot": "0.8.1",
    }
)
