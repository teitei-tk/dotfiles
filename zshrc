# -------------------------------------------
# setting
# -------------------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
setopt no_beep           # ビープ音を鳴らさないようにする
setopt correct

HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数

# -------------------------------------------
# history
# -------------------------------------------
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数

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
    color=${fg[red]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${fg_bold[red]}
  else
    color=${fg[red]}
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  # %{...%} surrounds escape string
  echo "%{$color%} ($name$action$color) %{$reset_color%}"
}

autoload bashcompinit
bashcompinit
source ~/.git-completion.bash

# -------------------------------------------
# alias
# -------------------------------------------
alias ls="ls -F"
alias la="ls -la"
alias ll="ls -l"
alias c="clear"
alias l="ls"
alias dir="ls"

PROMPT='%{${fg[green]}%}%n@%m%{${reset_color}%}`rprompt-git-current-branch`$ '
RPROMPT='%{${fg[blue]}%}[%d]%{${reset_color}%}'
