#!/bin/bash

ln -sf ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.vim
ln -sf ~/dotfiles/coc-settings.json ~/.vim/coc-settings.json

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

conda install -c conda-forge nodejs=18 -y
echo "Done. Run :PlugInstall inside vim"

