{ mkDerivation, base, directory, filepath, foldl, lib, optparse-applicative
, terminal-progress-bar, text, turtle, fetchFromGitHub }:

let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "topdf";
    rev = "35472f976508b21ed7ac9dc574f2e05c3b134a29";
    hash = "sha256-E7ADoDYIdAdbVHPFaw+wvxpPeW6e6MdoBS+COwZcNJ8=";
  };

in mkDerivation {
  pname = "topdf";
  version = "0.1.0.0";
  inherit src;
  sourceRoot = "${src.name}/topdf";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base
    directory
    filepath
    foldl
    optparse-applicative
    terminal-progress-bar
    text
    turtle
  ];
  license = "unknown";
  mainProgram = "topdf";
}
