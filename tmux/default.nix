{ stdenv, lib, writeText, writeShellScriptBin, tmuxPlugins, bash, tmux , symlinkJoin}:
with lib;
let

  rtpPath = "share/tmux-plugins";

  addRtp = path: rtpFilePath: attrs: derivation:
    derivation // {
      rtp = "${derivation}/${path}/${rtpFilePath}";
    } // {
      overrideAttrs = f: mkDerivation (attrs // f attrs);
    };

  mkDerivation = a@{

    pluginName,

    rtpFilePath ? (builtins.replaceStrings [ "-" ] [ "_" ] pluginName)
      + ".tmux", namePrefix ? "tmuxplugin-",

    src,

    unpackPhase ? "",

    configurePhase ? ":",

    buildPhase ? ":",

    addonInfo ? null,

    preInstall ? "",

    postInstall ? "",

    path ? (builtins.parseDrvName pluginName).name, dependencies ? [ ],

    ... }:

    addRtp "${rtpPath}/${path}" rtpFilePath a (stdenv.mkDerivation (a // {

      name = namePrefix + pluginName;

      inherit pluginName unpackPhase configurePhase buildPhase addonInfo
        preInstall postInstall;

      installPhase = ''
        runHook preInstall

        target=$out/${rtpPath}/${path}
        mkdir -p $out/${rtpPath}
        cp -r . $target
        if [ -n "$addonInfo" ]; then
          echo "$addonInfo" > $target/addon-info.json
        fi

        runHook postInstall
      '';

      dependencies = [ bash ] ++ dependencies;
    }));

  myYank = mkDerivation {
    pluginName = "yank";
    src = (builtins.fetchTarball
      "https://github.com/tmux-plugins/tmux-yank/archive/v2.3.0.tar.gz");
  };
  plugins = with tmuxPlugins; [
    pain-control
    copycat
    fzf-tmux-url
    open
    prefix-highlight
    myYank
  ];
  conf = writeText "tmux.conf" ((builtins.readFile ./tmux.cfg)
    + "${lib.concatStrings (map (x: ''
      run-shell ${x.rtp}
    '') plugins)}");

  alias-tm = writeShellScriptBin "tm" "${tmux}/bin/tmux -2 -L aoe -f ${conf} $@";
  alias-ta = writeShellScriptBin "ta" "${tmux}/bin/tmux -L aoe attach -t $@";

in symlinkJoin {
  name = "tmux";
  paths = [ tmux.out alias-tm.out alias-ta.out ];
}
