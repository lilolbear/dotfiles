#!/usr/bin/env bash

# Install Applications via Homebrew Casks.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Tap the Casks
brew tap caskroom/cask

# Quick Look plugins
brew cask install /
    qlcolorcode /
	qlstephen /
	qlmarkdown /
	quicklook-json /
	qlprettypatch /
	quicklook-csv /
	betterzip /
	webpquicklook /
	suspicious-package


# Install My Applications
brew cask install /
	1password /
	adobe-creative-cloud /
	app-cleaner /
	#atom /
	autodesk-fusion360 /
	#balsamiq-mockups /
	cheatsheet /
	docker  /
	dropbox /
	firefox /
	flip4mac /
	fontforge /
	github /
	google-chrome /
	google-drive-file-stream /
	google-hangouts /
	handbrake /
	iterm2 /
	java /
	join-together /
	karabiner-elements /
	launchpad-manager /
	local /
	#microsoft-remote-desktop-beta /
	osxfuse /
	#omnigraffle /
	prusaslicer /
	#sequel-pro /
	skype /
	slack /
	#sourcetree /
	spectacle /
	transmission /
	transmit /
	ultimaker-cura /
	unity-hub /
	#tunnelblick /
	#versions /
	visual-studio-code /
	vlc

# Return to install stuff that depends on things that come in casks (java)
#brew install ant

# adobe-creative-cloud only gets the installer so we run it
#open -a /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app

# Remove outdated versions from the cellar.
brew cleanup
