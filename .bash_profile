# shellcheck disable=SC2148

if [ -f ~/.bashrc ]; then
    # shellcheck disable=SC1090
    source ~/.bashrc
fi

# shellcheck disable=SC1091
. "$HOME/.cargo/env"
# Added by LM Studio CLI (lms)
if [ -d "$HOME/.lmstudio/bin" ]; then
    export PATH="$PATH:$HOME/.lmstudio/bin"
fi
# End of LM Studio CLI section
