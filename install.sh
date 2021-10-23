#!/usr/bin/env bash
###############################################################################
# install neovim
cd ~
# install basic nvim with python3 support
sudo apt install python3-neovim
# create plugin directory
mkdir ~/.local/share/nvim/plugged -p
# install plug for nvim (plugin manager)
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# create symlink for init.vim file to use version control
ln -sf ~/dotFiles/init.vim ~/.config/nvim/init.vim
# run plug install
nvim +'PlugInstall --sync' +qa
# install latest version of node for coc autocomplete
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
# create neovim venv for python
python3 -m venv .nvim-python3
~/.nvim-python3/bin/pip install neovim black
# install ctags as dependency
sudo apt install ctags 

###############################################################################



###############################################################################
# install i3
ln -sf ~/dotFiles/.config/i3/config ~/.config/i3/config
