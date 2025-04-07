{ mkDerivation, base, filepath, lib, neat-interpolation, optparse-applicative
, text, turtle, fetchFromGitHub }:

let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "mksession";
    rev = "b0042a4067ca31ff958852ba662a7f9a9d3cb121";
    hash = "sha256-1bWCSy/qfB8U0QvFcl6i5BEvdTvBLCv8ubTVnhcAgcE=";
  };

in mkDerivation {
  pname = "mksession";
  version = "0.1.0.0";
  inherit src;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends =
    [ base filepath neat-interpolation optparse-applicative text turtle ];
  license = lib.licenses.mit;
  mainProgram = "mksession";
}
