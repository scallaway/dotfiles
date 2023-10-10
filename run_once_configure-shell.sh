#!/bin/sh

# Zoxide (a better cd)
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Zsh Plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
mkdir ~/zsh-plugins
cd ~/zsh-plugins

# Git plugin
mkdir git
cd git
curl -o git.plugin.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh

# ZSH Syntax Highlighting
cd ~/zsh-plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
