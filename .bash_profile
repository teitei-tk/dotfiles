# shellcheck disable=SC2148

if [ -f ~/.bashrc ]; then
    # shellcheck disable=SC1090
    source ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"
