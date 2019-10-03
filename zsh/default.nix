{ stdenv, writeScriptBin, writeText, direnv, fasd, tmux, ranger, zsh }:
let
  zaw = ./zaw;
  zshrc = writeText "zshrc" ''
    export  EDITOR = "v"
    export  SHELL = "z"
    export  TERM = "xterm-256color"
    export  PAGER = "less"

    export DIRENV_LOG_FORMAT=
    export HISTFILE=~/.zsh_history
    export HISTSIZE=100000
    export SAVEHIST=100000
    unsetopt SHARE_HISTORY

    setopt extendedglob
    setopt extendedhistory
    setopt globcomplete
    setopt histnostore
    setopt histreduceblanks
    setopt correct
    setopt dvorak
    setopt interactivecomments
    setopt autopushd
    setopt autocd
    setopt beep

    bindkey -v
    if [[ "$TERM" = xterm ]]; then
    bindkey -v '\e[H' vi-beginning-of-line
    bindkey -v '\e[F' vi-end-of-line

    function set-title() {
      echo -en "\e]2;$2\a"
    }

    function reset-title() {
      echo -en "\e]2;''${(%):-%~}\a\a"
    }

    autoload -Uz add-zsh-hook
    add-zsh-hook preexec set-title
    add-zsh-hook precmd reset-title
    else
    bindkey -v '\e[1~' vi-beginning-of-line
    bindkey -v '\e[4~' vi-end-of-line
    fi

    bindkey '\e[A' up-line-or-history
    bindkey '\e[B' down-line-or-history

    bindkey '^H' backward-delete-char
    bindkey -v '\b' backward-delete-char
    bindkey -v '^?' backward-delete-char
    bindkey -v "^[[3~" delete-char

    bindkey -a 'gg' beginning-of-buffer-or-history
    bindkey -a G end-of-buffer-or-history

    bindkey -a u undo

    bindkey -a '\ ' vi-history-search-backward
    autoload -U   edit-command-line
    zle -N        edit-command-line
    bindkey -a 'v' edit-command-line

    zstyle ':completion:*' completer _expand _complete _ignored _approximate
    zstyle ':completion:*' expand prefix suffix
    zstyle ':completion:*' group-name '''
    zstyle ':completion:*' insert-unambiguous true
    zstyle ':completion:*' list-colors '''
    zstyle ':completion:*' list-prompt \
    %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' list-suffixes true
    zstyle ':completion:*' matcher-list ''' \
    'm:{[:lower:]}={[:upper:]}' \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
    'l:|=* r:|=*' \
    'r:|[._-]=** r:|=**'
    zstyle ':completion:*' max-errors 2 numeric
    zstyle ':completion:*' menu select=long
    zstyle ':completion:*' original true
    zstyle ':completion:*' preserve-prefix '//[^/]##/'
    zstyle ':completion:*' prompt \
    'Hm, did you mistype something? There are %e errors in the completion.'
    zstyle ':completion:*' select-prompt \
    %SScrolling active: current selection at %p%s
    zstyle ':completion:*' use-compctl false
    zstyle ':completion:*' verbose true

    autoload -Uz compinit
    compinit

    autoload -Uz zmv

    alias -g G='| grep'
    alias -g C='| xargs head -n 50'
    alias -g L="| bat -p"
    alias -g W="| wc -l"
    alias grep='rg'
    alias find='fd'
    alias c='cd'
    alias tb='nc termbin.com 9999'
    alias less='bat -p'
    alias grep='grep --color=auto'
    alias sudo="sudo env PATH=$PATH"
    alias sudo="nocorrect sudo"
    alias man="nocorrect man"
    alias fucking='sudo'
    alias mv='nocorrect mv'
    alias mkdir='nocorrect mkdir'

    alias in='task add +in 2>/dev/null'
    alias in-report='task in 2>/dev/null'
    tickle () {
        deadline=$1
        shift
        in +tickle wait:$deadline $@
    }
    alias think='tickle +1d'

    fignore=(.ali .o .toc .aux .swp)

    alias nixpaste="curl -F 'text=<-' http://nixpaste.lbr.uno"

    prompt_segment() {
      [[ -n $3 ]] && echo -n $3
    }


    eval "$(${direnv}/bin/direnv hook zsh)"

    eval "$(${fasd}/bin/fasd --init auto)"

    _cappane () {
    command ${tmux}/bin/tmux capture-pane -pS -0 | v -
    #print -n "\033[A"
    #zle && zle -I
    #cd "$(grep \^\' ${builtins.toPath ../ranger/ranger}/bookmarks | cut -b3-)"
    }

    zle -N _cappane
    bindkey -v '^P' _cappane


    source ${zaw}/zaw.zsh
    bindkey '^R' zaw-history
    bindkey '^E' zaw-commands
    bindkey '^J' zaw-fasd-directories
    stty -ixon
    alias j='fasd_cd -d'

    REPORTTIME=10

    source ${./zsh-syntax-highlighting-filetypes.zsh}

    bindkey -s "^S" "^Qnix-shell"
    bindkey -s "^T" "^Qtm"

    #magic-shell () {
      #exec nix-shell
    #}
    #zle -N magic-shell
    #bindkey "^S" magic-shell

    magic-cd () {
      eval "cd .."
      zle redisplay
      zle reset-prompt
    }
    zle -N magic-cd
    bindkey "^H" magic-cd

    prompt_nix_shell() {
      if [[ -n "$IN_NIX_SHELL" ]]; then
        if [[ -n $NIX_SHELL_PACKAGES ]]; then
          local package_names=""
          local packages=($NIX_SHELL_PACKAGES)
          for package in $packages; do
            package_names+=" ''${package##*.}"
          done
          prompt_segment 237 244 "{ nix: ''${package_names:1} }"
        elif [[ -n $name ]]; then
          local cleanName=''${name#interactive-}
          cleanName=''${cleanName%-environment}
          prompt_segment 237 244 "{ nix: $cleanName }"
        else # This case is only reached if the nix-shell plugin isn't installed or failed in some way
          prompt_segment 237 red "{ nix: {} }"
        fi
      fi
    }

    alias ls='exa'
    alias ll='exa-l'
    alias l='exa -la'

    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git svn
    #zstyle ':vcs_info: git*' formats "%b (%a) %m%u%c "
    #zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "
    zstyle ':vcs_info:git*' formats "[%b]%m%u%c"
    precmd() {
        vcs_info
    }
    setopt prompt_subst
    local p_machine='%(!..%B%F{white}%n%b%F{033}@)%B%F{white}%m'
    local p_path='%B%F{white}:%F{white}%~%B%F{178}'
    local p_exitcode='%F{green}%?%(!.%F{cyan}>.%b%F{green}>)%b%f '
    PROMPT='$(prompt_nix_shell)$p_machine$p_path''${vcs_info_msg_0_}$p_exitcode'

    _ranger () {
    PYTHONPATH= command ${ranger}/bin/ranger "$(pwd)"<$TTY
    print -n "\033[A"
    zle && zle -I
    cd "$(grep \^\' ${builtins.toPath ../ranger/ranger}/bookmarks | cut -b3-)"
    }

    zle -N _ranger
    bindkey -v '^N' _ranger

    _kglog () {
    command t-glog <$TTY
    zle && zle -I
    }

    zle -N _kglog
    bindkey -v '^G' _kglog

  '';

  zdotdir = stdenv.mkDerivation {
    name = "zdotdir";
    installPhase = ''
      mkdir $out
      cp ${zshrc} $out/.zshrc
    '';
    phases = [ "installPhase" ];
  };
in writeScriptBin "z" "ZDOTDIR=${zdotdir} ${zsh}/bin/zsh $@"
