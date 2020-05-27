{ ranger, writeShellScriptBin }:
writeShellScriptBin "rangersetup" "mkdir -p ~/.config/ranger && cp -r  ${builtins.toPath ./config}/*  ~/.config/ranger/"
