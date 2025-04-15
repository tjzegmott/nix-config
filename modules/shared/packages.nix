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
  goaccess
  ipmitool
  lazyjournal
  lazysql
  ncdu
  openssh
  prettyping
  sshuttle
  stow
  thefuck
  tldr
  wget
  zoxide

  # Shells and shell extensions
  nushell
  oh-my-posh
  carapace
  zsh-autosuggestions
  # zsh-completions
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
  # gnuplot
  imagemagick
  lf
  # mc # midnight-commander
  minio-client
  papis

  # Fonts and Writing
  hack-font
  meslo-lgs-nf
  pngpaste
  # nerdfonts
  # texliveBasic # Try to define tex plus deps in darwin/packages.nix

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
  virtualenv # globally install virtualenv
  python313
  # python312Packages.bugwarrior
  python313Packages.ipython

  # Neovim utils
  dwt1-shell-color-scripts  # Shell color scripts
  pokemon-colorscripts-mac  # Draw Pokemon in terminal
  chafa
]
