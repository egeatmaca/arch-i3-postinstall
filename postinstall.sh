## Arch I3 Postinstall ###

# Update mirrors
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist

# Update and install packages
sudo pacman -Syu --needed --noconfirm irefox ufw bluez bluez-utils blueman redshift git python-pip htop neofetch

# Enable installed services
sudo systemctl enable --now bluetooth
sudo ufw enable

# Install i3 starterpack
I3_STARTERPACK_URL="https://github.com/addy-dclxvi/i3-starterpack.git"
git clone $I3_STARTERPACK_URL && cp -a i3-starterpack/. ~ && sudo rm -r i3-starterpack
