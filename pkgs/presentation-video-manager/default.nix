{ mkDerivation, aeson, base, directory, filepath, lib, mtl, optparse-applicative
, tasty, tasty-hunit, text, transformers, yaml, fetchFromGitHub }:

let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "presentation-video-manager";
    rev = "91302d508f177eadc0ec6e55807bd758e0e8b9ee";
    hash = "sha256-Blg02hLx1GM8Clds2YsTiPTjpY8Vv2jHiChHi443EIo=";
  };
in mkDerivation {
  pname = "pvm";
  version = "0.1.0.0";
  inherit src;
  sourceRoot = "${src.name}/pvm";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson
    base
    directory
    filepath
    mtl
    optparse-applicative
    text
    transformers
    yaml
  ];
  executableHaskellDepends = [
    aeson
    base
    directory
    filepath
    mtl
    optparse-applicative
    text
    transformers
    yaml
  ];
  testHaskellDepends = [ base tasty tasty-hunit ];
  license = lib.licenses.mit;
  mainProgram = "pvm";
}
