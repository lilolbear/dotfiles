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

4. Make additional default directories for my projects
```bash
mkdir -p ~/Projects
```

5. Bootstrap the dotfiles
```bash
cd ~/Projects
git clone https://github.com/oddlots/dotfiles.git
ln -s ~/Projects/dotfiles ~/dotfiles && cd dotfiles && source bootstrap.sh
```

6. Make sure `~/config/.path` adds `/usr/local/bin` to the `$PATH` by adding the following:
```bash
echo 'export PATH="/usr/local/bin:$PATH"' > ~/config/.path
```

7. Untar the .extra and .ssh into ~ and keychains into ~/Library/Keychains

8. Sensible macOS defaults:
```bash
./bin/macos-setup.sh
```

9. Reboot for reassurance

## Install Applications
1. Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install Homebrew formulae and casks to install most of my software
```bash
./bin/brew-setup.sh
```

3. Install extensions for VS Code
```bash
./bin/vscode-setup.sh
```

4. Check these other Applications for which there aren't casks or they have failed in the past:
  - [Flex SDK](http://flex.apache.org/installer.html)
  - [Microsoft Remote Desktop](https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12)
  - [iterm2](https://www.iterm2.com/downloads.html) _brew cask failed_


## Configure Environment

TODO

## Thanks to…

@mathiasbynens and [his dotfiles repository](https://github.com/mathiasbynens/dotfiles) as well as his awesome [community](https://github.com/mathiasbynens/dotfiles#thanks-to)


## just a useful reference
https://sourabhbajaj.com/mac-setup/
