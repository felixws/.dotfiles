export XDG_CONFIG_HOME=$HOME/.config
VIM="nvim"

PERSONAL=$XDG_CONFIG_HOME/personal
source $PERSONAL/env
for i in `find -L $PERSONAL`; do
    source $i
done

# Set PATH, MANPATH, etc., for Homebrew.
if ! [ -x "$(command -v brew)" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! [ -x "$(command -v direnv)" ]; then
    eval "$(direnv hook zsh)"
fi
