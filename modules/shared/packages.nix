{ pkgs }:

with pkgs; [
  # General packages for development and system management
  atac
  zsh-completions
  zsh-fzf-tab
  fzf
  fd
  bat
  btop
  bottom
  htop
  thefuck
  ipmitool
  coreutils
  openssh
  wget
  zip
  lazygit
  stow

  # Encryption and security tools

  # Cloud-related tools and SDKs
  docker
  docker-compose
  lazydocker
  kubectl
  k9s
  helm
  krew

  # Version management
  git
  delta
  gh

  # Media-related packages
  emacs-all-the-icons-fonts
  ffmpeg
  glow
  imagemagick
  gnuplot
  lf
  # mc # midnight-commander
  minio-client

  # Fonts
  nerdfonts
  meslo-lgs-nf
  hack-font

  # Node.js development tools
  bun
  nodePackages.npm # globally install npm
  nodejs

  # Text and terminal utilities
  # neovim # nix only at v0.9.5
  htop
  yq
  ripgrep
  tree
  tmux
  unrar
  unzip

  # Time management and task organisation
  timewarrior
  taskwarrior3

  # Python packages
  python311
  python311Packages.bugwarrior
  python311Packages.virtualenv # globally install virtualenv
  poetry
  pre-commit
  commitizen
]
