### Arch I3 Postinstall ###

# Update mirrors
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist

# Update and install pacman packages
sudo pacman -Syu --needed --noconfirm alacritty rofi thunar feh picom htop neofetch bluez bluez-utils blueman redshift firefox ufw neovim git python-pip docker docker-buildx docker-compose otf-geist-mono-nerd

# Install and update yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
yay

# Install LazyVim
mv ~/.config/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Enable installed services
sudo systemctl enable --now bluetooth
sudo ufw enable

# Copy dotfiles
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
sudo cp -a $SCRIPT_DIR/dotfiles/root/. /
cp -a $SCRIPT_DIR/dotfiles/user/. ~
