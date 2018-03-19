#!/bin/bash

echo "system updates"
sudo softwareupdate -i -a

echo "brew cleanup and updates"
brew update
brew upgrade
brew cleanup -s
brew cask cleanup

echo "brew diagnotic stuff"
brew doctor
brew missing

echo "Atom upgrade stuff"
apm upgrade -c false

#echo "NPM update stuff"
#npm update -g
echo "Yarn update stuff"
yarn global upgrade;

echo "Ruby gems update stuff"
sudo gem update --system
sudo gem update
sudo gem cleanup
