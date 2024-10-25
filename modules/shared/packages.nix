{ pkgs }:

with pkgs; [
  # General packages for development and system management
  atac
  bat
  bottom
  btop
  chezmoi
  coreutils
  direnv
  eza
  fd
  fzf
  htop
  ipmitool
  lazygit
  nushell
  oh-my-posh
  tldr
  terraform
  openssh
  stow
  thefuck
  wget
  zoxide
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-fzf-tab

  # Encryption and security tools

  # Cloud-related tools and SDKs
  docker
  docker-compose
  lazydocker
  kubectl
  k9s
  kubernetes-helm
  krew

  # Version management
  git
  delta
  gh

  # Media-related packages
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
  zip
  texliveBasic

  # Time management and task organisation
  timewarrior
  taskwarrior3

  # Python packages
  python311
  #python311Packages.bugwarrior
  python311Packages.virtualenv # globally install virtualenv
  poetry
  pre-commit
  commitizen
]
