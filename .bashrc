# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# local definitions
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# command completion for git
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# macosxでChromeがインストールされていれば、Chrome.appを開く
if [ `uname` == "Darwin" ]; then
    if [ -d /Applications/Google\ Chrome.app ]; then
        alias chrome="open /Applications/Google\ Chrome.app"
    fi
fi

GIT_PS1_SHOWDIRTYSTATE=true
export PATH=$PATH:/usr/local/share/npm/bin
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export HISTSIZE=2000
export HISTFILESIZE=2000
export TERM=xterm-256color

#tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# User specific aliases and functions
alias ls="ls -F"
alias la="ls -la"
alias ll="ls -l"
alias c="clear"
alias l="ls"
alias dir="ls"

cd $HOME

# added by travis gem
[ -f /Users/teitei/.travis/travis.sh ] && source /Users/teitei/.travis/travis.sh
