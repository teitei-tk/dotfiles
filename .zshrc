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
# prompt
# -------------------------------------------
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' %c%u(%b)'
zstyle ':vcs_info:*' actionformats ' %c%u(%s:%b|%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%(!,%F{red}root,%F{green}%n )>>%B%F{red}%1(v|%1v|)%f%b %B%F{blue}%~%f%b
%F{white}$ "

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

if [ -x "$(which direnv)" ]; then
  eval "$(direnv hook zsh)"
fi
