{ symlinkJoin, writeShellScriptBin, tig }:
symlinkJoin {
  name = "tig";
  paths = [
    (writeShellScriptBin "tig" "XDG_CONFIG_HOME=${./config} ${tig}/bin/tig $@").out
    (writeShellScriptBin "t" "XDG_CONFIG_HOME=${./config} ${tig}/bin/tig status $@").out
  ];
}
