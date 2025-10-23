{
  description = "Per-project TeX devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux"; # Change this to your desired system 
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          (texlive.combine {
            inherit (texlive)
              scheme-small
              latexmk
              collection-latexrecommended
              collection-fontsrecommended
              collection-langjapanese
              xetex luatex dvisvgm dvipng
              uplatex comment subfigure mathtools
              physics siunitx titlesec here
              float placeins ulem url moreverb
              tocbibind biber biblatex
              chktex;
          })
          ghostscript
          poppler_utils
        ];
      };
  };
}