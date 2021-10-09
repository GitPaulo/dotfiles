#!/bin/bash
echo 'Removing default dotfiles...'
rm ~/.bash_profile ~/.bashrc ~/.curlrc ~/.gitconfig ~/.vimrc ~/.wgetrc ~/.config/neofetch/config.conf ~/.config/fish/config.fish

echo 'Stowing dem new ones...'
stow -vSt ~ bash curl wget vim git fish neofetch

