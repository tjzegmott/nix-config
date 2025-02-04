{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [

  # Security and authentication

  # App and package management
  home-manager

  # Media and design tools

  # Productivity tools

  # Audio tools

  # Testing and development tools

  # Screenshot and recording tools

  # Text and terminal utilities

  # File and system utilities
  sqlite

  # Other utilities

  # PDF viewer

  # Music and entertainment
]
