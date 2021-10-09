#!/bin/bash

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

# Fisher (PM)
fish -C "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && exit"

# Pure (fish prompt)
fish -C "fisher install pure-fish/pure && exit"
