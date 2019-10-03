{ symlinkJoin, writeScriptBin, tig }:
symlinkJoin {
  name = "tig";
  paths = [
    (writeScriptBin "tig" "XDG_CONFIG_HOME=${builtins.toPath ./.} tig").out
    (writeScriptBin "t" "XDG_CONFIG_HOME=${builtins.toPath ./.} tig status").out
  ];
}
