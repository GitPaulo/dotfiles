#!/bin/bash

fname=$1

if [ $# -eq 0 ]; then
  read -e -p "Font name?" fname
fi

curl -fLo "${fname} Nerd Font Complete.otf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/<FONT_NAME>%20Nerd%20Font%20Complete.otf
