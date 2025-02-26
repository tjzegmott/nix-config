{ pkgs }:

with pkgs;
let 
  shared-packages = import ../shared/packages.nix { inherit pkgs; };
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-small
    dvisvgm dvipng # for preview and export as html
    wrapfig amsmath ulem hyperref capt-of
    aastex revtex;
  };
in
  shared-packages ++ [
    dockutil
    tex
  ]
