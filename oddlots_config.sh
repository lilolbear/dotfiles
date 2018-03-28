#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.oddlots` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Local Development Environment Setup                                         #
###############################################################################

# link to my Dropbox .atom config
ln -s ~/Dropbox/.config/.atom ~/.atom

# Create the .odd local domain redirect
#sudo mkdir $(brew --prefix)/etc
#sudo echo 'address=/.odd/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf

# start dnsmasq and setup to restart automagically infinitum
#sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
#sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

#sudo mkdir /etc/resolver
#sudo echo "nameserver 127.0.0.1" > /etc/resolver/odd

###############################################################################
# Lazy apache config
###############################################################################
# move the old apache config files out of the way and put one ones from my seed directory in place
# For posterity, the seed alters httpd.conf to:
#   - uncomment libphp5, mod_vhost_alias, and httpd-vhosts.conf (mod_rewrite)
#   - add libphp7 (optional)
#   - change the user:group to my own smelton:staff and admin to sam@oddlots.org
#   - uncomment Servername and change to localhost
#   - DocumentRoot & Directory become /Users/smelton/Sites
#   - AllowOverride becomes All
# In httpd-vhosts.conf It adds a wildcard vhosts in for the .odd domain to resolve at ~/Sites/%1/www
#sudo mkdir /private/etc/apache2/oddlots
#sudo cp -R /private/etc/apache2/httpd.conf /private/etc/apache2/extra /private/etc/apache2/oddlots/
#sudo cp -R ~/seed/apache2/* /private/etc/apache2/

sudo mkdir -p ~/Sites ~/Projects/
sudo cp -R ~/seed/local ~/Sites/.
git config --global gpg.program /usr/local/MacGPG2/bin/gpg2
git config --global commit.gpgsign true

#sudo apachectl restart
