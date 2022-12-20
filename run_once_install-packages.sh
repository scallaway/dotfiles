#!/bin/sh

sudo apt get update -y
sudo apt get upgrade -y
sudo apt get dist-upgrade -y

# Install the basic dependencies
sudo apt install software-properties-common zsh autojump jq nq unzip build-essentials ripgrep

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# Install neovim so we have something to work with (can build from source later)
sudo apt install neovim


