#!/bin/bash

# env=home,work
env=$1

if [ -z "$env" ]; then
  echo 'Environment argument required. (home/work)' && exit;
fi

echo 'Removing default dotfiles...'
for stowDir in */; do
  echo "<-- Unstowing ${stowDir}"
  stow -D "$stowDir"
  
  if [ $? -eq 0 ]; then
    echo OK
  else
    echo FAIL
  fi
done

read -p "Stow? [y/n]"$'\n' -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo -e "Did not stow. Exiting..."
  exit
fi  

echo 'Stowing dem new ones...'
for stowDir in */; do
  stowDirPath="./${stowDir}${env}"
  if [ -d "$stowDirPath" ]; then
    cd "$stowDir" || exit
    echo "--> Stowing ${stowDirPath} for env '${env}'..."
    stow -vSt ~ "$env"
    cd - || exit
  else
    echo "--> Stowing ${stowDirPath} without env..."
    stow -vSt ~ "$stowDir"
  fi

  if [ $? -eq 0 ]; then
    echo OK
  else
    echo FAIL
  fi
done
