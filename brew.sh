#!/bin/sh
echo Installing Homebrew...
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo Installing command line tools
brew install wget thefuck tmux vim
