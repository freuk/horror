{ pkgs ? import (builtins.fetchTarball
  "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") { }
}:

let callPackage = pkgs.lib.callPackageWith pkgs;

in rec {
  vim = callPackage ./vim { };
  tmux = callPackage ./tmux { };
}
