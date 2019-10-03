{ pkgs }:
pkgs.writeScriptBin "ranger"
"${pkgs.ranger}/bin/ranger --confdir=${builtins.toPath ./ranger} $@"
