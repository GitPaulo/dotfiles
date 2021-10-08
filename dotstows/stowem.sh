#!/bin/bash
echo 'Removing default dotfiles...'
rm ~/.bash_profile ~/.bash_profile_aliases ~/.bash_profile_functions ~/.bashrc ~/.curlrc ~/.gitconfig ~/.vimrc ~/.wgetrc

echo 'Stowing dem new ones...'
stow -vSt ~ bash curl wget vim git

