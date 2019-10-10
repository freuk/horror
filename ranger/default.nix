{ ranger, writeShellScriptBin }:
writeShellScriptBin "rangersetup" "mkdir -p ~/.config/ranger && cp -r ${./config}/* ~/.config/ranger/"
