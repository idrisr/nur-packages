# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:
(rec {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # NixOS modules

  booknote = pkgs.callPackage ./pkgs/booknote { inherit pdftc; };
  mksession = pkgs.haskell.packages.ghc965.callPackage ./pkgs/mksession { };
  newcover = pkgs.haskell.packages.ghc96.callPackage ./pkgs/newcover { };
  pdftc = pkgs.callPackage ./pkgs/pdftc { };
  # pipe-rename = pkgs.callPackage ./pkgs/pipe-rename { };
  pvm =
    pkgs.haskell.packages.ghc965.callPackage ./pkgs/presentation-video-manager
    { };
  slide2text = pkgs.haskell.packages.ghc948.callPackage ./pkgs/slide2text { };
  topdf = pkgs.haskell.packages.ghc965.callPackage ./pkgs/topdf { };
  videoChapter =
    pkgs.haskell.packages.ghc96.callPackage ./pkgs/videoChapter { };
  vttclean = pkgs.haskell.packages.ghc96.callPackage ./pkgs/vttclean { };
} // pkgs.lib.genAttrs [
  "audioPreview"
  "awscost"
  "mdtopdf"
  "seder"
  "srtcpy"
  "transcribe"
] (x: pkgs.callPackage ./pkgs/${x} { }))
