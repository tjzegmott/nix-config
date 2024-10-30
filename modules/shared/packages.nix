{ pkgs }:

with pkgs; [
  # General packages for development and system management
  atac
  atuin
  chezmoi
  coreutils
  direnv
  eza
  fd
  fzf
  ncdu
  prettyping
  ipmitool
  openssh
  stow
  thefuck
  tldr
  wget
  zoxide

  # Shells and shell extensions
  nushell
  oh-my-posh
  zsh-autosuggestions
  zsh-completions
  zsh-fzf-tab
  zsh-syntax-highlighting

  # Encryption and security tools

  # Cloud-related tools and SDKs
  docker
  docker-compose
  k9s
  krew
  kubectl
  kubernetes-helm
  lazydocker
  terraform

  # Database Tools
  postgresql_13

  # Version management
  delta
  gh
  git
  lazygit

  # Media-related packages
  ffmpeg
  glow
  gnuplot
  imagemagick
  lf
  # mc # midnight-commander
  minio-client

  # Fonts and Writing
  hack-font
  meslo-lgs-nf
  nerdfonts
  texliveBasic

  # Node.js development tools
  bun
  nodePackages.npm # globally install npm
  nodejs

  # Text and terminal utilities
  # neovim # nix only at v0.9.5
  bat
  bottom
  btop
  htop
  ripgrep
  tmux
  tree
  unrar
  unzip
  yq
  zip

  # Time management and task organisation
  timewarrior
  taskwarrior3
  vit

  # Python packages
  commitizen
  poetry
  pre-commit
  python311
  python311Packages.bugwarrior
  python311Packages.virtualenv # globally install virtualenv
]
