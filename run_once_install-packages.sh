#!/bin/sh

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Install the basic dependencies
sudo apt install software-properties-common zsh autojump jq nq unzip ripgrep

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# Install neovim so we have something to work with (can build from source later)
sudo apt install neovim


