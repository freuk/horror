{ pkgs }:
pkgs.writeScriptBin "r"
"${pkgs.ranger}/bin/ranger --confdir=${builtins.toPath ./ranger} $@"
