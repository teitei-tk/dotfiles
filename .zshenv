# -------------------------------------------
# env
# -------------------------------------------
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/eclipse/android/platform-tools
export TERM=xterm-256color
PROMPT='%{${fg[green]}%}%n@%m%{${reset_color}%} `rprompt-git-current-branch`$ '
RPROMPT='%{${fg_bold[blue]}%}[%d]%{${reset_color}%}'
