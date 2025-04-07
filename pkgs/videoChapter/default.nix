{ mkDerivation, aeson, base, bytestring, containers, fmt, lib
, optparse-applicative, text, time, fetchFromGitHub }:

let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "videoChapter";
    rev = "f9d508fbc36c85ea77441cc261074c32ef69dd37";
    hash = "sha256-zal+PWkmcYjYGQg5GkwDSJu3rcIdFG2jD7FX23XURjQ=";
  };

in mkDerivation {
  pname = "videoChapter";
  version = "0.1.0.0";
  inherit src;
  sourceRoot = "${src.name}/videoChapter";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends =
    [ aeson base bytestring containers fmt optparse-applicative text time ];
  description = "Extract and display video chapter information";
  license = lib.licenses.mit;
  mainProgram = "videoChapter";
}
