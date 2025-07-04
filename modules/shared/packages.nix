{ pkgs }:

with pkgs; [
  # Basic packages
  #coreutils
  #openssh

  # General packages for development and system management
  atac
  atuin
  chezmoi
  direnv
  eza
  fd
  fzf
  goaccess
  ipmitool
  lazyjournal
  lazysql
  ncdu
  prettyping
  sshuttle
  systemctl-tui
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

  # Database Tools
  postgresql_13

  # Version management
  delta
  gh
  git
  lazygit

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
