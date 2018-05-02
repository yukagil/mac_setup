#!/bin/bash -u

ln -snfv ~/mac_setup/dotfiles/.zshrc ~
chsh -s /bin/zsh
source ~/.zshrc
