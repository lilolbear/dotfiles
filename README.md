# Oddlots dotfiles

Based upon excellent [dotfiles repo](https://github.com/mathiasbynens/dotfiles) by mathiasbynens. I'd suggest that you start with his and work from there as his community support is excellent and my changes are largely opinionated and hacky and only marginally tested beyond my own development machines.

**Warning:** If you're still interested in how I have things setup, or in my additions then proceed at your own risk!

These notes are culled from [here](https://github.com/mathiasbynens/dotfiles/blob/master/README.md) to summarize just the steps I needed to perform.

## Preparation (ie _before_ you start)
1. Insure that the dotfiles repository commited and up to date
2. Export Keychains
3. Tar up the .extra, .ssh/, Keychains, and any other files that your destroying
4. Move the tarball to a USB or other secure location

Ready to Rock n Roll

## Reformat & Install MacOS
1. Restart while holding down the option key to boot from a USB fob that has the latest MacOS and start the install
2. Get the machine on the internet (wifi or wired)
3. Update MacOS from Apple
```bash
sudo softwareupdate -i -a
reboot
xcode-select --install
```

4. Make additional default directories for my projects and local sites
```bash
mkdir -p ~/Projects ~/Sites
```

5. Bootstrap the dotfiles
```bash
cd ~/Projects
git clone https://github.com/oddlots/dotfiles.git
ln -s ~/Projects/dotfiles ~/dotfiles && cd dotfiles && source bootstrap.sh
```

6. Make sure `~/.path` adds `/usr/local/bin` to the `$PATH` by adding the following:
```bash
echo 'export PATH="/usr/local/bin:$PATH"' > ~/.path
```

7. Untar the .extra and .ssh into ~ and keychains into ~/Library/Keychains

8. Sensible macOS defaults:
```bash
./.macos
```

9. Reboot for reassurance

## Install Applications
1. Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install Homebrew formulae
```bash
./brew.sh
```

3. Use Homebrew Casks to install most of my software
```bash
./brewcasks.sh
```

4. Check these other Applications for which there aren't casks or they have failed in the past:
  - [Flex SDK](http://flex.apache.org/installer.html)
  - [Microsoft Remote Desktop](https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12)
  - [iterm2](https://www.iterm2.com/downloads.html) _brew cask failed_


## Configure Environment

Per [this](https://tommcfarlin.com/syncing-atom-settings/) I keep some of my less sensitive configs on dropbox like .atom.

1. Log into Dropbox and start the .config folder downloading

2. Link to my Dropbox .atom config
```bash
ln -s ~/Dropbox/.config/.atom ~/.atom
```
3. Make the local site functional
```bash
cd ~/Projects
git clone https://github.com/oddlots/LocalHomePage.git
ln -s ~/Projects/LocalHomePage ~/Sites/local
```
4. Create a ~/.path file and add in stuff from the brew files. for example:
```bash
#homebrew (installed earlier)
export PATH="/usr/local/sbin:$PATH"
#homebrew gnubin (for updated core utils)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#homebrew libxml2
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# PHP you use on the command line
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="$(brew --prefix)/opt/php/bin:$PATH"
```

## Configure Localhost webhost and .odd domain

1. Create the .odd local domain redirect
```bash
sudo mkdir $(brew --prefix)/etc
sudo echo 'address=/.odd/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
```

2. start dnsmasq and setup to restart automagically infinitum
```bash
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir /etc/resolver
sudo echo "nameserver 127.0.0.1" > /etc/resolver/odd
```

3. Edit the apache config files. Theres a bunch going on in these so I'm just going to say diff the files with the defaults to see what I changed.
```bash
cd /usr/local/etc/httpd
mv httpd.conf httpd.conf.old
mv extra/httpd-vhosts.conf extra/httpd-vhosts.conf.old
cp ~/Dropbox/.config/apache/httpd.conf .
cp ~/Dropbox/.config/apache/httpd-vhosts.conf extra/.
```

> For those of you following from home, this isn't going to help since you don't have these files. Contact me if you want them or start to piece together what you might need from [here](https://getgrav.org/blog/macos-mojave-apache-multiple-php-versions) and [here](https://mallinson.ca/posts/5/the-perfect-web-development-environment-for-your-new-mac).

4. Restart apache
```bash
sudo apachectl restart
```

5. Test by opening your browser to localhost

## Thanks to…

@mathiasbynens and [his dotfiles repository](https://github.com/mathiasbynens/dotfiles) as well as his awesome [community](https://github.com/mathiasbynens/dotfiles#thanks-to)
