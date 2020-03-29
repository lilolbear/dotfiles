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

brew install /
	moreutils / # Install some other useful utilities like `sponge`.
	findutils / # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
	gnu-sed / # Install GNU `sed`, overwriting the built-in `sed`.
	bash / # Install Bash
	bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` and more recent versions of some macOS tools.
brew install /
	wget /
	vim /
	grep /
	openssh /
	screen /
	php /
	gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install /
	sfnt2woff /
	sfnt2woff-zopfli /
	woff2

# Install other useful binaries.
brew install /
	ack /
	#dnsmasq /
	git /
	git-lfs /
	imagemagick /
	lua /
	lynx /
	#mariadb /
	#mysql /
	nmap /
	p7zip /
	#php-code-sniffer /
	#php-cs-fixer /
	pigz /
	pv /
	rename /
	rlwrap /
	rsync /
	ssh-copy-id /
	tree /
	vbindiff /
	wp-cli
	#yarn
	zopfli /


# Install Applications via Homebrew Casks.
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

# Remove outdated versions from the cellar.
brew cleanup

# adobe-creative-cloud only gets the installer so we run it
#open -a /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app

# If sharing brew with another user on the system
# add a group called 'brew', add your users and then do the following:
#sudo chgrp -R brew $(brew --prefix)/*
#sudo chmod -R g+w $(brew --prefix)/*
