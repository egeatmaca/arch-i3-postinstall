# Arch-I3-Postinstall
Arch-I3-Postinstall setups 
- a super lightweight system (< 500 MB memory usage)
- with a user-friendly tiling window manager,
- additional system software (bluetooth, nightlight, firewall etc.),
- and software development packages

## Requirements
1. Arch Linux installed using [archinstall](https://wiki.archlinux.org/title/archinstall) script. Select the following parameters during installation.<br>
Profile: Desktop>i3-wm <br>
Additional Packages: git
2. Internet connection

## Setup
<code>
git clone https://github.com/egeatmaca/arch-i3-postinstall.git <br>
/bin/bash arch-i3-postinstall/postinstall.sh
</code>

## Getting Started
- Open terminal: Win+Return
- Launch application: Win+A
- Close focused window: Win+Q
- Show i3 config (incl. all key bindings): <br>
<code> cat ~/.config/i3/config </code>

## Screenshots
![screen1](./screenshots/screen1.png)
![screen2](./screenshots/screen2.png)
![screen3](./screenshots/screen3.png)