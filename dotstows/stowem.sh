#!/bin/bash

# env=home,work
env=$1

echo 'Removing default dotfiles...'
rm ~/.bash_profile ~/.bashrc ~/.curlrc ~/.gitconfig ~/.vimrc ~/.wgetrc ~/.config/neofetch/config.conf ~/.config/fish/config.fish ~/.config/ranger/rc.conf ~/.config/ranger/commands.py

echo 'Stowing dem new ones...'
for stowDir in */; do
  stowDirPath="./${stowDir}${env}"
  if [ -d "$stowDirPath" ]; then
    cd "$stowDir" || exit
    stow -vSt ~ "$env"
    echo "--> Stowed ${stowDirPath} for env '${env}'"
    cd - || exit
  else
    stow -vSt ~ "$stowDir"
    echo "--> Stowed ${stowDirPath} without env"
  fi
done
