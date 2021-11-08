#!/bin/bash

# env=home,work
env=$1

if [ -z "$env" ]
then
  echo 'Environment argument required. (home/work)' && exit;
fi

echo 'Removing default dotfiles...'
rm ~/.bash_profile ~/bash_profile_aliases ~/bash_profile_functions ~/.bashrc ~/.bash_it ~/.curlrc ~/.gitconfig ~/.vimrc ~/.wgetrc ~/.config/neofetch/config.conf ~/.config/fish/config.fish ~/.config/ranger/rc.conf

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
