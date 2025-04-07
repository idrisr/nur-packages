{ stdenvNoCC, makeWrapper, pipe-rename, neovim }:
stdenvNoCC.mkDerivation {
  name = "pipe-rename";
  pname = "pipe-rename";
  dontUnpack = true;
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p "$out/bin"
    cp ${pipe-rename}/bin/renamer $out/bin/renamer
    wrapProgram $out/bin/renamer --add-flags "--editor='${neovim}/bin/nvim --clean'"
  '';
}
