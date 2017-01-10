#!/usr/bin/sh
echo Installing Homebrew...
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
echo Installing required packages...
brew install wget numpy thefuck python3 scala groovy tmux erlang
