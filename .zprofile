# -------------------------------------------
# env
# -------------------------------------------
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export TERM=xterm-256color

if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"

  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.golang" ]; then
  export GOPATH=$HOME/.golang
  export PATH="$GOPATH/bin:$PATH"
fi

if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source $HOME/.cargo/env
fi

if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

if [ -d "$HOME/.volt" ]; then
  export VOLTPATH=$HOME/.volt
fi

if [ -d "/usr/local/Caskroom/google-cloud-sdk" ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi
