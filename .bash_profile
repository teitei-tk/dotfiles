# shellcheck disable=SC2148

if [ -f ~/.bashrc ]; then
    # shellcheck disable=SC1090
    source ~/.bashrc
fi

# shellcheck disable=SC1091
. "$HOME/.cargo/env"
