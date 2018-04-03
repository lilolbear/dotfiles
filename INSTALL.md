This is just a culled notes of the steps I need to perform

## Preparation
1. Insure that the dotfiles repository commited and up to date
2. Export Keychains
3. Tar up the .extra, .ssh/, Keychains, etc
4. Move the tarball to a USB or other secure location

Ready to Rock n Roll

## Reformat & Install MacOS
1. Restart while holding down the option key to boot from Little_Red and start the High Sierra install
2. Get the machine on the internet (wifi or wired)
3. Update MacOS from Apple
```bash
sudo softwareupdate -i -a
reboot
xcode-select --install
```

4. Make the directories for the dot files to reside in
```bash
cd; mkdir ~/Projects/public/dotfiles; ln -s ~/Projects/public/dotfiles ~/dotfiles
```

5. Bootstrap the dotfiles
```bash
git clone https://github.com/lilolbear/dotfiles.git && cd dotfiles && source bootstrap.sh
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

4. Install these other Applications for which there aren't casks (or failed):
  - [Flex SDK](http://flex.apache.org/installer.html)
  - [Microsoft Remote Desktop](https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12)
  - [NoteBurner Audiobook Converter](http://www.noteburner.com/noteburner-itunes-drm-audio-converter.dmg)
  - [PopcornTime](https://popcorn-time.to/mac.html)
  - [VPN.ht](https://github.com/VPNht/desktop/releases/download/v0.0.3/VPN.ht-0.0.3.pkg)
  - [iterm2](https://www.iterm2.com/downloads.html) brew cask failed


## Configure Environment
1. Log into Dropbox and start the .config folder downloading

2. Link to my Dropbox .atom config
```bash
ln -s ~/Dropbox/.config/.atom ~/.atom
```
3. Make the default working directories and
sudo mkdir -p ~/Sites ~/Projects/
cd ~/Sites
git clone https://github.com/lilolbear/localsite.git

4. Edit the ~/.path file to add in all the brew files
```bash
#homebrew (installed earlier)
export PATH="/usr/local/sbin:$PATH"
#homebrew gnubin (for updated core utils)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#homebrew gettext
#export PATH="/usr/local/opt/gettext/bin:$PATH"
#homebrew libxml2
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# PHP you use on the command line
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="$(brew --prefix)/opt/php/bin:$PATH"
# Make sure this gets into the .path to make gpg work
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
```

5. Lazy apache config

> Create the .odd local domain redirect
sudo mkdir $(brew --prefix)/etc
sudo echo 'address=/.odd/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf

> start dnsmasq and setup to restart automagically infinitum
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

>sudo mkdir /etc/resolver
sudo echo "nameserver 127.0.0.1" > /etc/resolver/odd

>move the old apache config files out of the way and put one ones from my seed directory in place
For posterity, the seed alters httpd.conf to:
   - uncomment libphp5, mod_vhost_alias, and httpd-vhosts.conf (mod_rewrite)
   - add libphp7 (optional)
   - change the user:group to my own smelton:staff and admin to sam@oddlots.org
   - uncomment Servername and change to localhost
   - DocumentRoot & Directory become /Users/smelton/Sites
   - AllowOverride becomes All
In httpd-vhosts.conf It adds a wildcard vhosts in for the .odd domain to resolve at ~/Sites/%1/www
sudo mkdir /private/etc/apache2/oddlots
sudo cp -R /private/etc/apache2/httpd.conf /private/etc/apache2/extra /private/etc/apache2/oddlots/
sudo cp -R ~/seed/apache2/* /private/etc/apache2/

>sudo apachectl restart 
