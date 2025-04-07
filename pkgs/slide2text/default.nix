{ mkDerivation, base, bytestring, directory, filepath, lib, optparse-applicative
, raw-strings-qq, terminal-progress-bar, text, typed-process, fetchFromGitHub
, tesseract, writeShellApplication }:
let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "slide2text";
    rev = "db5f86601929f2446b3c7e2f48b0434003accf03";
    hash = "sha256-3CWOnewfmgaEhqS3YB00bj3xJ6q6KKCaymVEUw6u34g=";
  };
  slide2text = mkDerivation {
    pname = "slide2text";
    version = "0.1.0.0";
    inherit src;
    sourceRoot = "${src.name}/slide2text";
    isLibrary = true;
    isExecutable = true;
    libraryHaskellDepends = [
      base
      bytestring
      directory
      filepath
      optparse-applicative
      raw-strings-qq
      typed-process
    ];
    executableHaskellDepends =
      [ base bytestring directory terminal-progress-bar text ];
    license = "unknown";
    mainProgram = "slide2text";
  };
in writeShellApplication {
  name = "slide2text";
  runtimeInputs = [ slide2text tesseract ];
  text = ''
    exec slide2text "$@"
  '';
}
