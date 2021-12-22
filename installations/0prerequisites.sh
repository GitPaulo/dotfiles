#!/bin/bash

echo "Making sure we good..."
sudo apt update
sudo apt upgrade -y

echo "Installing prerequisites..."
# stow 
sudo apt install stow -y
# fish
sudo apt install build-essential cmake ncurses-dev libncurses5-dev libpcre2-dev gettext -y
# bro
sudo apt install ruby-full -y
# fuck
sudo apt install python3-dev python3-pip python3-setuptools -y
# vim YCm
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs default-jdk npm
