This is just a culled notes of the steps I need to perform

## Preparation
1. Insure that the dotfiles repository commited and up to date
2. Tar up the .extras, .ssh/, Keychains, etc
3. Move the tarball to a USB or other secure location

Ready to Rock n Roll

## Reformat & Install MacOS
1. Restart while holding down the option key to boot from Little_Red and start the High Sierra install
2. Get the machine on the internet (wifi or wired)
3. Update MacOS from Apple
```bash
sudo softwareupdate -i -a
```

4. Make the directories for the dot files to reside in
```bash
cd; mkdir ~/Projects/dotfiles; ln -s ~/Projects/dotfiles ~/dotfiles
```

5. Bootstrap the dotfiles
```bash
git clone https://github.com/lilolbear/dotfiles.git && cd dotfiles && source bootstrap.sh
```

6. Make sure `~/.path` adds `/usr/local/bin` to the `$PATH` by adding the following:
```bash
export PATH="/usr/local/bin:$PATH"
```

7. Untar the .extras and .ssh into ~ and keychains into ~/Library/Keychains
8. Sensible macOS defaults:
```bash
./.macos
```

## Install Applications
1. Install Xcode
```bash
xcode-select --install
```

2. Homebrew
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

4. Install these other Applications for which there aren't casks:
  - [Flex SDK](http://flex.apache.org/installer.html)
  - [Microsoft Remote Desktop](https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12)
  - [NoteBurner Audiobook Converter](http://www.noteburner.com/noteburner-itunes-drm-audio-converter.dmg)
  - [PopcornTime](https://popcorn-time.to/mac.html)
  - [VPN.ht](https://github.com/VPNht/desktop/releases/download/v0.0.3/VPN.ht-0.0.3.pkg)

## Configure Environment
1. Run my config file
```bash
./oddlots_config.sh
```
