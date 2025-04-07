{ mkDerivation, base, foldl, lib, optparse-applicative, text, turtle
, fetchFromGitHub }:
let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "vttclean";
    rev = "99200e9bd5e3abe6c65be10daa3124649349ab1a";
    hash = "sha256-K79/2l4mhpdb+xyZOagB8B3u2t4jlIk9T8KfGGiAYQc=";
  };

in mkDerivation {
  pname = "vttclean";
  version = "0.1.0.0";
  inherit src;
  sourceRoot = "${src.name}/vttclean";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base foldl optparse-applicative text turtle ];
  license = lib.licenses.mit;
  mainProgram = "vttclean";
}
