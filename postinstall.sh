### Arch I3 Postinstall ###

# Update mirrors
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist

# Update and install pacman packages
sudo pacman -Syu --needed --noconfirm alacritty rofi htop neofetch bluez bluez-utils blueman redshift firefox code git python-pip

# Install and update yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
yay

# Enable installed services
sudo systemctl enable --now bluetooth
sudo ufw enable

# Copy dotfiles
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cp -a $SCRIPT_DIR/dotfiles/root/. /
cp -a $SCRIPT_DIR/dotfiles/user/. ~