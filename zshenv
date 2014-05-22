export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

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

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/eclipse/android/platform-tools
export TERM=xterm-256color
PROMPT='%{${fg[green]}%}%n@%m%{${reset_color}%} `virtualenv_info``rprompt-git-current-branch`$ '
RPROMPT='%{${fg_bold[blue]}%}[%d]%{${reset_color}%}'
