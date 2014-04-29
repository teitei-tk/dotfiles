# -------------------------------------------
# setting
# -------------------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
setopt no_beep           # ビープ音を鳴らさないようにする
setopt correct           # command check

bindkey -v

# -------------------------------------------
# load setting
# -------------------------------------------
source ~/.bashrc_local

# -------------------------------------------
# history
# -------------------------------------------
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=20000            # メモリに保存されるヒストリの件数
SAVEHIST=20000            # 保存されるヒストリの件数
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない


# -------------------------------------------
# color
# -------------------------------------------
# カラー表示を有効化
autoload -U colors; colors
colors

# -------------------------------------------
# 補完
# -------------------------------------------
# 補完機能を有効化
autoload -Uz compinit
compinit

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# オプション保管時にセパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt print_eight_bit  #日本語ファイル名等8ビットを通す


# -------------------------------------------
# Set vi mode status bar
# from http://www.zsh.org/mla/users/2002/msg00108.html
# -------------------------------------------
# Reads until the given character has been entered.
readuntil () {
    typeset a
    while [ "$a" != "$1" ]
    do
        read -E -k 1 a
    done
}

# If the $SHOWMODE variable is set, displays the vi mode, specified by
# the $VIMODE variable, under the current command line.
# 
# Arguments:
#
#   1 (optional): Beyond normal calculations, the number of additional
#   lines to move down before printing the mode.  Defaults to zero.
showmode() {
    typeset movedown
    typeset row

    # Get number of lines down to print mode
    movedown=$(($(echo "$RBUFFER" | wc -l) + ${1:-0}))
    
    # Get current row position
    echo -n "\e[6n"
    row="${${$(readuntil R)#*\[}%;*}"
    
    # Are we at the bottom of the terminal?
    if [ $((row+movedown)) -gt "$LINES" ]
    then
        # Scroll terminal up one line
        echo -n "\e[1S"
        
        # Move cursor up one line
        echo -n "\e[1A"
    fi
    
    # Save cursor position
    echo -n "\e[s"
    
    # Move cursor to start of line $movedown lines down
    echo -n "\e[$movedown;E"
    
    # Change font attributes
    echo -n "\e[1m"
    
    # Has a mode been set?
    if [ -n "$VIMODE" ]
    then
        # Print mode line
        echo -n "-- $VIMODE -- "
    else
        # Clear mode line
        echo -n "\e[0K"
    fi

    # Restore font
    echo -n "\e[0m"
    
    # Restore cursor position
    echo -n "\e[u"
}

clearmode() {
    VIMODE= showmode
}

#
# Temporary function to extend built-in widgets to display mode.
#
#   1: The name of the widget.
#
#   2: The mode string.
#
#   3 (optional): Beyond normal calculations, the number of additional
#   lines to move down before printing the mode.  Defaults to zero.
#
makemodal () {
    # Create new function
    eval "$1() { zle .'$1'; ${2:+VIMODE='$2'}; showmode $3 }"

    # Create new widget
    zle -N "$1"
}

# Extend widgets
makemodal vi-add-eol           INSERT
makemodal vi-add-next          INSERT
makemodal vi-change            INSERT
makemodal vi-change-eol        INSERT
makemodal vi-change-whole-line INSERT
makemodal vi-insert            INSERT
makemodal vi-insert-bol        INSERT
makemodal vi-open-line-above   INSERT
makemodal vi-substitute        INSERT
makemodal vi-open-line-below   INSERT 1
makemodal vi-replace           REPLACE
makemodal vi-cmd-mode          NORMAL

unfunction makemodal

# -------------------------------------------
# git
# -------------------------------------------
setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color action

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi

  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=${fg[red]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${fg_bold[red]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${fg_bold[yellow]}
  else
    color=${fg_bold[red]}
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  # %{...%} surrounds escape string
  echo "%{$color%}($name$action$color)%{$reset_color%}"
}

autoload bashcompinit
bashcompinit
source ~/.git-completion.bash


# -------------------------------------------
# env
# -------------------------------------------
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python2.6`
    export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
    export WORKON_HOME=$HOME/.virtualenvs
    source `which virtualenvwrapper.sh`
    export VIRTUAL_ENV_DISABLE_PROMPT=1
fi

function virtualenv_info {
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) $reset_color"
}


# -------------------------------------------
# alias
# -------------------------------------------
alias ls="ls -F"
alias la="ls -la"
alias ll="ls -l"
alias c="clear"
alias l="ls"
alias dir="ls"
alias history="history 1"
alias current_branch='git st | awk "NR==1" | awk "x{print $3}"'

cd $HOME

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/eclipse/android/platform-tools
export TERM=xterm-256color
PROMPT='%{${fg[green]}%}%n@%m%{${reset_color}%} `virtualenv_info``rprompt-git-current-branch`$ '
RPROMPT='%{${fg_bold[blue]}%}[%d]%{${reset_color}%}'
