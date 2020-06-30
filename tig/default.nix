{ symlinkJoin, writeShellScriptBin, tig }:
symlinkJoin {
  name = "tig";
  paths = [
    (writeShellScriptBin "t" "${tig}/bin/tig status $@").out
  ];
}
