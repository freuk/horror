{ pkgs ? import (builtins.fetchTarball
  "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") { }
}:
let callPackage = pkgs.lib.callPackageWith pkgs;
in rec {
  inherit (pkgs)
    nix-zsh-completions fasd zsh-completions zsh-navigation-tools direnv ripgrep
    exa atool poppler_utils nixfmt;

  vim = callPackage ./vim { };
  tmux = callPackage ./tmux { };
  zsh = callPackage ./zsh { inherit tmux ranger; };
  ranger = callPackage ./ranger { };
}
