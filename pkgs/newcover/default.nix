{ mkDerivation, attoparsec, base, bytestring, filepath, io-streams, lib
, microlens-platform, optparse-applicative, raw-strings-qq, tasty, tasty-hunit
, temporary, transformers, fetchFromGitHub }:
let
  src = fetchFromGitHub {
    owner = "idrisr";
    repo = "newcover";
    rev = "5bd653ae8eb72c9cab55b764f296835e02d6c257";
    hash = "sha256-D2rCdGVt8WUfbJjfneOn9SQxPsDq5zBhg5P2LXMGyhE=";
  };

in mkDerivation {
  pname = "newcover";
  version = "0.1.0.0";
  inherit src;
  sourceRoot = "${src.name}/newcover";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    attoparsec
    base
    bytestring
    filepath
    io-streams
    microlens-platform
    optparse-applicative
    transformers
  ];
  executableHaskellDepends =
    [ base bytestring io-streams microlens-platform temporary transformers ];
  testHaskellDepends = [
    attoparsec
    base
    bytestring
    microlens-platform
    raw-strings-qq
    tasty
    tasty-hunit
  ];
  license = "unknown";
  mainProgram = "newcover";
}
