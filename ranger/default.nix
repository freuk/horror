{ ranger, writeShellScriptBin }:
writeShellScriptBin "rangersetup" "mkdir -p ~/.config/ranger && install -d ${./config}/* ~/.config/ranger/"
