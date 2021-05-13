# shellcheck disable=SC2148
# -------------------------------------------
# env
# -------------------------------------------
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export TERM=xterm-256color

if [ -d "$HOME/.anyenv/envs/goenv" ]; then
   export GOENV_ROOT="$HOME/.anyenv/envs/goenv"
   export PATH="$GOENV_ROOT/bin:$PATH"
fi

if [ -d "${HOME}"/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"

  eval "$(anyenv init -)"
  for D in "$HOME"/.anyenv/envs/**
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/repos" ]; then
  export PATH="$GOROOT/bin:$PATH"
  export GOPATH=$HOME/repos
  export PATH="$GOPATH/bin:$PATH"
fi

if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  # shellcheck disable=SC1091
  source "$HOME"/.cargo/env
fi

if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi