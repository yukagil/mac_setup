#!/bin/bash -u

cd ~/dotfiles/

if which brew >/dev/null 2>&1; then

    echo "run brew doctor"
    brew doctor

else

    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fi

echo "run brew update"
brew update

if [ -e Brewfile ]; then

    echo "run brew bundle"
    brew bundle
    
    echo "cleanup..."
    brew cleanup
    brew cask cleanup

fi

echo "all process completed!!"
