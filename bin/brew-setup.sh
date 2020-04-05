#!/usr/bin/env bash

# Install most stuff using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` and more recent versions of some macOS tools.
brew install wget
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
#brew install dnsmasq
brew install git
brew install git-lfs
brew install imagemagick
brew install lua
brew install lynx
#brew install mariadb
#brew install mysql
brew install nmap
brew install p7zip
#brew install php-code-sniffer
#brew install php-cs-fixer
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install rsync
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install wp-cli
#brew install yarn
brew install zopfli


# Install Applications via Homebrew Casks.
brew tap caskroom/cask

# Quick Look plugins
brew cask install
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzip
brew cask install webpquicklook
brew cask install suspicious-package

# Install My Applications
brew cask install
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install app-cleaner
#brew cask install atom
brew cask install autodesk-fusion360
#brew cask install balsamiq-mockups
brew cask install cheatsheet
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install flip4mac
brew cask install fontforge
brew cask install github
brew cask install google-chrome
brew cask install google-drive-file-stream
brew cask install google-hangouts
brew cask install handbrake
brew cask install iterm2
brew cask install java
brew cask install join-together
brew cask install karabiner-elements
brew cask install launchpad-manager
brew cask install local
#brew cask install microsoft-remote-desktop-beta
brew cask install osxfuse
#brew cask install omnigraffle
brew cask install prusaslicer
brew cask install sequel-pro
brew cask install skype
brew cask install slack
#brew cask install sourcetree
brew cask install spectacle
brew cask install transmission
brew cask install transmit
brew cask install ultimaker-cura
brew cask install unity-hub
#brew cask install tunnelblick
#brew cask install versions
brew cask install visual-studio-code
brew cask install vlc
brew cask install wrike

# Remove outdated versions from the cellar.
brew cleanup

# adobe-creative-cloud only gets the installer so we run it
#open -a /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app

# If sharing brew with another user on the system
# add a group called 'brew', add your users and then do the following:
#sudo chgrp -R brew $(brew --prefix)/*
#sudo chmod -R g+w $(brew --prefix)/*
