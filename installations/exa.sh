#!/bin/bash

# from source..
sudo apt install libgit2-dev rustc -y
sudo apt-mark auto rustc
git clone https://github.com/ogham/exa --depth=1
cd exa
cargo build --release && cargo test #cargo test is optional
sudo install target/release/exa /usr/local/bin/exa
cd ..
rm -rf exa
sudo apt purge --autoremove -y
