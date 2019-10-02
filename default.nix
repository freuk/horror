{ pkgs ? import (builtins.fetchTarball
  "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") { }
}:

let callPackage = pkgs.lib.callPackageWith pkgs;

in rec {
  vim = callPackage ./vim { };
  tmux = callPackage ./tmux { };
  zsh = callPackage ./zsh { };
  ranger = callPackage ./ranger { };

  nix-zsh-completions = pkgs.nix-zsh-completions;
  fasd = pkgs.fasd;
  zsh-completions = pkgs.zsh-completions;
  zsh-navigation-tools = pkgs.zsh-navigation-tools;
  direnv = pkgs.direnv;
  ripgrep = pkgs.ripgrep;
  exa = pkgs.exa;
  atool = pkgs.atool;
  poppler_utils = pkgs.poppler_utils;
}
