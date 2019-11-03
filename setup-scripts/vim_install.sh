#!/bin/bash
SETUP_SCRIPTS_DIR=$DOTFILE_DIR/setup-scripts/
source $SETUP_SCRIPTS_DIR/utils.sh
install_if_needed vim 

echo "source $DOTFILE_DIR/vim/.vimrc" > ~/.vimrc

[[ ! -f ~/.vim/bundle/Vundle.vim  ]] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo done
