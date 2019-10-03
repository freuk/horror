{ pkgs }:
with pkgs.lib;
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

    addRtp "${rtpPath}/${path}" rtpFilePath a (pkgs.stdenv.mkDerivation (a // {

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

      dependencies = [ pkgs.bash ] ++ dependencies;
    }));

  myYank = mkDerivation {
    pluginName = "yank";
    src = (builtins.fetchTarball
      "https://github.com/tmux-plugins/tmux-yank/archive/v2.3.0.tar.gz");
  };
  plugins = with pkgs.tmuxPlugins; [
    resurrect
    pain-control
    copycat
    fpp
    open
    prefix-highlight
    myYank
  ];
  conf = pkgs.writeText "tmux.conf" ((builtins.readFile ./tmux.cfg)
    + "${pkgs.lib.concatStrings (map (x: ''
      run-shell ${x.rtp}
    '') plugins)}");
in pkgs.stdenv.mkDerivation {
  name = "tmux";
  buildInputs = [pkgs.tmux];
  installPhase = ''
    mkdir -p $out/bin
    ln -s ${pkgs.writeScriptBin "tm" "${pkgs.tmux}/bin/tmux -2 -L aoe -f ${conf} $@"}/bin/tm $out/bin/tm
    ln -s ${pkgs.writeScriptBin "ta" "${pkgs.tmux}/bin/tmux -L aoe attach -t $@"}/bin/ta $out/bin/ta
  '';
  phases = [ "installPhase" ];
}
