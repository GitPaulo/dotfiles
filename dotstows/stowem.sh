#!/bin/bash

# env=home,work
env=$1

if [ -z "$env" ]; then
  echo 'Environment argument required. (home/work)' && exit;
fi

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

read -n 1 -p "Stow (y/n)? " answer
if [[ ! $answer =~ ^[Yy]$ ]]; then
  echo -e "Did not stow. Exiting..."
  exit
fi  

echo -e 'Stowing...'
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
