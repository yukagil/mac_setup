#!/bin/bash -u

ln -snfv ~/dotfiles/.zshrc ~
chsh -s /bin/zsh
source ~/.zshrc