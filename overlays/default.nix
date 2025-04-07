{
  # Add your overlays here
  pipe-rename = final: prev: {
    pipe-rename = prev.stdenvNoCC.mkDerivation {
      name = "pipe-rename";
      pname = "pipe-rename";
      dontUnpack = true;
      nativeBuildInputs = [ final.makeWrapper ];
      installPhase = ''
        mkdir -p "$out/bin"
        cp ${final.pipe-rename}/bin/renamer $out/bin/renamer
        wrapProgram $out/bin/renamer --add-flags "--editor='${final.neovim}/bin/nvim --clean'"
      '';
    };
  };

}
