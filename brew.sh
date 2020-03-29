#!/usr/bin/env bash

# Install command-line tools using Homebrew.

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
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`
brew install wget

# Install more recent versions of some macOS tools.
brew install /
	vim /
	grep /
	openssh /
	screen /
	php /
	gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install /
	ack /
	git /
	git-lfs /
	imagemagick /
	lua /
	lynx /
	p7zip /
	pigz /
	pv /
	rename /
	rlwrap /
	ssh-copy-id /
	tree /
	vbindiff /
	zopfli

# Oddlots binaries
brew install /
	#dnsmasq /
	#mariadb /
	#mysql /
	nmap /
	#php-code-sniffer /
	#php-cs-fixer /
	rsync /
	wp-cli
	#yarn

# Remove outdated versions from the cellar.
brew cleanup

# If sharing brew with another user on the system
# add a group called 'brew' and then do the following:
#sudo chgrp -R brew $(brew --prefix)/*
#sudo chmod -R g+w $(brew --prefix)/*
