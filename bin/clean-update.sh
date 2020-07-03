#!/bin/bash

echo "--------------------------"
echo "system updates"
echo "--------------------------"
sudo softwareupdate -i -a

echo "--------------------------"
echo "brew cleanup and updates"
echo "--------------------------"
brew update
brew upgrade
brew cleanup -s

echo "--------------------------"
echo "brew diagnotic stuff"
echo "--------------------------"
brew doctor
brew missing

#echo "--------------------------"
#echo "NPM update stuff"
#echo "--------------------------"
npm update -g
#echo "--------------------------"
#echo "Yarn update stuff"
#echo "--------------------------"
#yarn global upgrade;

#echo "--------------------------"
#echo "Ruby gems update stuff"
#echo "--------------------------"
#sudo gem update --system
#sudo gem update
#sudo gem cleanup
