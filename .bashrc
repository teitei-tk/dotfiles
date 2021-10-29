# shellcheck disable=SC2148

# Source global definitions
if [ -f /etc/bashrc ]; then
    # shellcheck disable=SC1091
    . /etc/bashrc
fi

# local definitions
if [ -f ~/.bashrc_local ]; then
    # shellcheck disable=SC1090
    source ~/.bashrc_local
fi

# User specific aliases and functions
alias ls="ls -F"
alias la="ls -la"
alias ll="ls -l"
alias c="clear"
alias l="ls"
alias dir="ls"
alias repos='cd $( ghq list --full-path | peco )'

if [ -f "$HOME/.cargo/env" ]; then
    # shellcheck disable=SC1091
    source "$HOME/.cargo/env"
fi
