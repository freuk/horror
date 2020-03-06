{ 
  nixpkgs ? import <nixpkgs> {},

  fetched ? s: (nixpkgs.nix-update-source.fetch s).src,

  pkgs ? import (fetched ./pkgs.json) { }
}:
let callPackage = pkgs.lib.callPackageWith pkgs;
in rec {
  inherit (pkgs)
    nix-zsh-completions fasd zsh-completions zsh-navigation-tools direnv ripgrep
    exa atool poppler_utils nixfmt hwloc htop git tree  ranger bat;

  vim = callPackage ./vim { inherit zsh; };
  tig = callPackage ./tig { };
  tmux = callPackage ./tmux { };
  zsh = callPackage ./zsh { inherit tmux ranger; };
  rangersetup = callPackage ./ranger { };

  horror = pkgs.writeShellScriptBin "horror" ''
    rangersetup && echo "export TERM=tmux-256color && export SHELL=`which zsh` && exec zsh -l" >> ~/.bash_profile
  '';
}
