{ ranger, writeShellScriptBin }:
writeShellScriptBin "rangersetup" "mpkdir -p ~/.config/ranger && cp -r ${./config}/* ~/.config/ranger/"
