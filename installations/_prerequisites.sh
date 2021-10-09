#!/bin/bash

echo "Making sure we good..."
sudo apt update
sudo apt upgrade -y

echo "Installing prerequisites..."

# Stow 
sudo apt install stow

# fish
sudo apt install build-essential cmake ncurses-dev libncurses5-dev libpcre2-dev gettext
