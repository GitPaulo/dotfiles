#!/bin/bash

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

# Fisher (PM)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Pure (fish prompt)
fisher install pure-fish/pure
