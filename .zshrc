# -------------------------------------------
# default settings
# -------------------------------------------
export EDITOR=vim        # default editor is vim
export LANG=ja_JP.UTF-8  # lang = ja_JP
export LC_ALL=ja_JP.UTF-8
setopt no_beep           # no beep sound
setopt correct           # command check

bindkey -e

# -------------------------------------------
# utility funcion
# -------------------------------------------
load_file_exists () {
    if [ -e $1 ]; then
        source $1
    fi
}

# load from local shell settings.
load_file_exists "$HOME/.zshrc_local"

# -------------------------------------------
# history
# -------------------------------------------
HISTFILE=~/.zsh_history   # save of comannds history file
HISTSIZE=20000            # on memory history size
SAVEHIST=20000            # save history counts
setopt inc_append_history # to save every command
setopt hist_reduce_blanks # remove duplicate spaces
setopt hist_ignore_dups   # ignore duplicate command


# -------------------------------------------
# color
# -------------------------------------------
# enable color
autoload -U colors; colors; colors

# -------------------------------------------
# autocomplete
# -------------------------------------------
# enable auto complete
autoload -Uz compinit; compinit

setopt auto_param_slash      # auto append slash
setopt mark_dirs             # match directory as append slash
setopt list_types            # autocomplete list is render file mark
setopt print_eight_bit       # enable utf-8

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

# -------------------------------------------
# alias
# -------------------------------------------
alias ls="ls -F"
alias la="ls -la"
alias ll="ls -l"
alias l="ls"
alias c="clear"
alias dir="ls"
alias history="history 1"
alias repos='cd $( ghq list --full-path | peco )'
alias random-string='python -c "import string, random; print(str().join([random.choice(string.ascii_letters + string.digits) for i in range(100)]))"'

# start from home directory.
cd $HOME

eval "$(direnv hook zsh)"
