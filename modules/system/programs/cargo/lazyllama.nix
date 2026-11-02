{
  lib,
  rustPlatform,
  fetchCrate,
  pkg-config,
  openssl,
}:
let

  hash_crate = "sha256-9eFEb+COAMqg6TprD7sSJKbi8TwgmlCFO3nFEkfjgjs=";
  hash_cargo = "sha256-2kYRn9L+P/Qou10HLtQmOleldqTd7sPI9H0+6w6Pico=";
in

rustPlatform.buildRustPackage rec {
  pname = "lazyllama";
  version = "0.5.3";

  src = fetchCrate {
    inherit pname version;
    hash = hash_crate;
  };

  cargoHash = hash_cargo;
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];
  meta = {
    description = "Lightweight TUI client for Ollama";
    homepage = "https://github.com/Pommersche92/lazyllama";
    license = lib.licenses.gpl2Plus;
    mainProgram = "lazyllama";
  };
}
