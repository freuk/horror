{ ranger, writeShellScriptBin, symlinkJoin, stdenv }:
let
  ranger-conf = writeShellScriptBin "ranger"
    "${ranger}/bin/ranger --confdir=${builtins.toPath ./ranger} $@";
  scope = stdenv.mkDerivation {
    name = "scope";
    src = ./scope;
    installPhase = ''
      mkdir -p $out/bin
      cp $src/scope.sh $out/bin
    '';
  };
in symlinkJoin {
  name = "ranger";
  paths = [ ranger-conf.out scope.out ];
}
