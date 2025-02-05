{ config, osConfig, pkgs, lib, home-manager, ... }:

let
  user = "tzegmott";
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in {
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    enableNixpkgsReleaseCheck = false;
    packages = pkgs.callPackage ./packages.nix { };
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      # EDITOR = "${pkgs.my-emacs-with-packages}/bin/neovim";
    };
    file = lib.mkMerge [ sharedFiles additionalFiles ];
    stateVersion = "23.11";
  };

  news.display = "silent";

  fonts.fontconfig.enable = true;

  programs = { } // import ../shared/home-manager.nix {
    inherit config osConfig pkgs lib;
  };
}
