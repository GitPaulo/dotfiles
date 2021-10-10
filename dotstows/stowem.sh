#!/bin/bash

# env=home,work

options=("home" "work" "quit")
select env in "${options[@]}"; do
  case $env in
  "home")
    echo "Stowing for home environmment."
    break
    ;;
  "work")
    echo "Stowing for work environmment."
    break
    ;;
  "quit")
    exit
    ;;
  *) echo "invalid option!" ;;
  esac
done

echo 'Removing default dotfiles...'
rm ~/.bash_profile ~/.bashrc ~/.curlrc ~/.gitconfig ~/.vimrc ~/.wgetrc ~/.config/neofetch/config.conf ~/.config/fish/config.fish

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
