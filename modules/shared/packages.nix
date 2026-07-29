{ pkgs }:

with pkgs; [
  # Basic packages
  #coreutils
  #openssh

  # General packages for development and system management
  atac
  atuin
  chezmoi
  devpod
  direnv
  eza
  fd
  fzf
  goaccess
  ipmitool
  lazyjournal
  ncdu
  # openstackclient  # move to uv tool with deps
  prettyping
  snitch
  sshuttle
  systemctl-tui
  tshark
  tree-sitter
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
  postgresql

  # Version management
  delta
  gh
  git
  gitbutler
  lazygit

  # Fonts and Writing
  hack-font
  meslo-lgs-nf
  neovim
  pngpaste
  # nerdfonts
  # texliveBasic # Try to define tex plus deps in darwin/packages.nix

  # Node.js development tools
  bun
  nodejs

  # Text and terminal utilities
  neovim
  bat
  bottom
  btop
  d2
  htop
  ripgrep
  slides
  tmux
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
  copier
  poetry
  prek
  uv
  python314

  # Neovim utils
  dwt1-shell-color-scripts  # Shell color scripts
  pokemon-colorscripts-mac  # Draw Pokemon in terminal
  chafa
]
