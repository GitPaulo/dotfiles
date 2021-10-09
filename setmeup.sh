#!/bin/bash
# Full one tap installation script for everything

function installations () {
  cd installations || exit
  for installation in ./*.sh; do
    read -p "Run installation: '${installation}'? [y/n]"$'\n' -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      echo -e "Skipped installation...\n"
    else 
      "$installation"
    fi
  done
  cd - || exit
}

function stowem () {
  cd dotstows || exit
  ./stowem.sh
  cd - || exit
}

read -p "Run installations? [y/n]"$'\n' answer
case ${answer:0:1} in
    y|Y )
        installations; 
    ;;
    * )
        echo -e "Skipped installations...\n"
    ;;
esac

read -p "Run stows? [y/n] "$'\n' answer2
case ${answer2:0:1} in
    y|Y )
        stowem;
    ;;
    * )
        echo -e "Skipped stows...\n"
    ;;
esac
