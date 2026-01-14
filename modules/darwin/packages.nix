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
    # Cloud-related tools and SDKs
    docker
    docker-compose
    k9s
    krew
    kubectl
    kubernetes-helm
    lazydocker
    terraform

    # Media-related packages
    ffmpeg
    glow
    # gnuplot
    imagemagick
    lf
    superfile # Potential alternative to lf
    # mc # midnight-commander
    minio-client
    papis

    dockutil
    tex
  ]
