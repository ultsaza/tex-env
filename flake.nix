{
  description = "Per-project TeX devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    forAll = f: nixpkgs.lib.genAttrs systems (system:
      let pkgs = import nixpkgs { inherit system; };
      in f pkgs
    );
  in {
    devShells = forAll (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          (texlive.combine {
            inherit (texlive)
              scheme-small
              latexmk
              collection-latexrecommended
              collection-fontsrecommended
              collection-langjapanese
              xetex luatex dvisvgm dvipng
              uplatex
              comment
              subfigure mathtools
              physics siunitx
              titlesec
              here
              float
              placeins
              ulem
              url
              moreverb
              tocbibind
              chktex;
          })
          ghostscript
          poppler_utils
        ];
        # VS Code からも PATH を確実に拾わせたい場合の目印
        shellHook = ''
          echo "TeX devShell ready (latexmk=$(command -v latexmk))"
        '';
      };
    });
  };
}
