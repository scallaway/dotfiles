#!/bin/sh

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Install the basic dependencies
sudo apt install 							\
	software-properties-common                                      \
	zsh                                                             \
	autojump                                                        \
	jq                                                              \
	nq                                                              \
	unzip                                                           \
	ripgrep                                                         \
	cmake                                                           \
	ninja-build                                                     \
	gettext                                                         \
	curl                                                            \
	fzf                                                             \
	tmux                                                            \
	htop

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash


