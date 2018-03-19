#!/usr/bin/env bash

# Install Applications via Homebrew Casks.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Tap the Casks
brew tap caskroom/cask

# Install My Applications
brew cask install adobe-creative-cloud
brew cask install atom
brew cask install balsamiq-mockups
brew cask install bbedit
brew cask install dropbox
brew cask install firefox
brew cask install flip4mac
brew cask install github
brew cask install google-chrome
brew cask install google-drive-file-stream
brew cask install handbrake
brew cask install iterm2
brew cask install join-together
brew cask install omnigraffle
brew cask install sourcetree
brew cask install sequel-pro
brew cask install skype
brew cask install slack
brew cask install transmission
brew cask install transmit
brew cask install versions
brew cask install vlc


# Remove outdated versions from the cellar.
brew cleanup
