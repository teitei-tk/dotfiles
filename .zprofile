# shellcheck disable=SC2148
# -------------------------------------------
# env
# -------------------------------------------
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export TERM=xterm-256color

if [ -e "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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
    # shellcheck disable=SC1091
  source "$HOME"/.cargo/env
fi

if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

if [ -d "$(brew --prefix)/opt/mysql@5.7/bin" ]; then
  # shellcheck disable=SC2155
  export PATH="$(brew --prefix)/opt/mysql@5.7/bin:$PATH"
fi

if [ -d "$(brew --prefix)/opt/openjdk" ]; then
  # shellcheck disable=SC2155
  export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"
fi

if [ -d "$HOME/.pub-cache" ]; then
  export PATH="$PATH":"$HOME/.pub-cache/bin"
fi
