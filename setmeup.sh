#!/bin/bash
# Full one tap installation script for everything

export DOTFILES=~/dotfiles

function installations () {
  cd "${DOTFILES}/installations" || exit
  for installation in ./*.sh; do
    read -p "Run installation: '${installation}'? [y/n]"$'\n' -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo -e "Skipped installation...\n"
    else
      echo
      ./"$installation" $1
    fi
  done
  cd - || exit
}

function stowem () {
  cd "${DOTFILES}/dotstows" || exit
  ./stowem.sh $1
  cd - || exit
}

function postsetups() {
  vim +'PlugInstall --sync' +qa
  echo "Ignore .vimrc erorrs, installed plugins restart vim!"
}

options=("home" "work" "quit")
select env in "${options[@]}"; do
  case $env in
  "home")
    echo "Starting setup for home environmment..."
    break
    ;;
  "work")
    echo "Starting setup for work environmment."
    break
    ;;
  "quit")
    exit
    ;;
  *) echo "Invalid environment option!" ;;
  esac
done

read -p "Run installations? [y/n]"$'\n' answer
case ${answer:0:1} in
    y|Y )
        installations $env; 
    ;;
    * )
        echo -e "Skipped installations...\n"
    ;;
esac

read -p "Run stows? [y/n] "$'\n' answer2
case ${answer2:0:1} in
    y|Y )
        stowem $env;
    ;;
    * )
        echo -e "Skipped stows...\n"
    ;;
esac

read -p "Run post-setups? [y/n] "$'\n' answer3
case ${answer3:0:1} in
    y|Y )
        postsetups $env;
    ;;
    * )
        echo -e "Skipped post-setups...\n"
    ;;
esac
