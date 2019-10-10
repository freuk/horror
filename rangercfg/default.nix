{ ranger, writeShellScriptBin }:
writeShellScriptBin "rangersetup" "cp -r ${./config}/* ~/.config/ranger/"
