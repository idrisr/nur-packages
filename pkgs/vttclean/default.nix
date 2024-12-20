{ haskell, compiler ? "ghc965" }:
haskell.packages.${compiler}.callCabal2nix "" ./. { }
