#!/bin/bash

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y

# Fisher (PM)
fish -C "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && exit"

# Pure (fish prompt)
fish -C "fisher install pure-fish/pure && exit"
