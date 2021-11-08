#!/bin/bash

echo "Making sure we good..."
sudo apt update
sudo apt upgrade -y

echo "Installing prerequisites..."
# stow 
sudo apt install stow
# fish
sudo apt install build-essential cmake ncurses-dev libncurses5-dev libpcre2-dev gettext
# bro
sudo apt-get install ruby-full
# fuck
sudo apt install python3-dev python3-pip python3-setuptools
