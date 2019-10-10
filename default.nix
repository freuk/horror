{ pkgs ? import (builtins.fetchTarball
  "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") { }
}:
let callPackage = pkgs.lib.callPackageWith pkgs;
in rec {
  inherit (pkgs)
    nix-zsh-completions fasd zsh-completions zsh-navigation-tools direnv ripgrep
    exa atool poppler_utils nixfmt hwloc htop git tree unar ranger;

  vim = callPackage ./vim { };
  tig = callPackage ./tig { };
  tmux = callPackage ./tmux { };
  zsh = callPackage ./zsh { inherit tmux ranger; };
  rangersetup = callPackage ./rangersetup { };

  horror = pkgs.writeShellScriptBin "horror" ''
    rangersetup && echo "export SHELL=z && exec zsh -l" >> ~/.bash_profile
  '';
}
