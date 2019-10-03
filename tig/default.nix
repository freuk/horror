{ symlinkJoin, writeScriptBin, tig }:
symlinkJoin {
  name = "tig";
  paths = [
    (writeScriptBin "tig" "XDG_CONFIG_HOME=${builtins.toPath ./.} ${tig}/bin/tig").out
    (writeScriptBin "t" "XDG_CONFIG_HOME=${builtins.toPath ./.} ${tig}/bin/tig status").out
  ];
}
