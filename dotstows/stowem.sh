#!/bin/bash

# env=home,work
env=$1

if [ -z "$env" ]; then
  echo 'Environment argument required. (home/work)' && exit;
fi

read -n 1 -p "Unstow (y/n)? " answer1; echo
if [[ ! $answer1 -eq ^[Yy]$ ]]; then
  echo 'Unstowing...'
  
  for stowDir in */; do
    echo "🗑️ Unstowing ${stowDir}"
    stow -D "$stowDir"

    if [ $? -eq 0 ]; then
      echo OK
    else
      echo FAIL
    fi
  done
fi  

read -n 1 -p "Stow (y/n)? " answer2; echo
if [[ ! $answer2 -eq ^[Yy]$ ]]; then
  echo -e 'Stowing...'
  
  for stowDir in */; do
    stowDirPath="./${stowDir}${env}"
    if [ -d "$stowDirPath" ]; then
      cd "$stowDir" || exit
      echo "--> Stowing ${stowDir} for env '${env}'..."
      stow -vSt ~ "$env"
      cd - || exit
    else
      echo "--> Stowing ${stowDir} without env..."
      stow -vSt ~ "$stowDir"
    fi

    if [ $? -eq 0 ]; then
      echo OK
    else
      echo FAIL
    fi
done
fi  
