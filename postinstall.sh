### Arch I3 Postinstall ###

# Constants
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PACKAGE_LISTS=$SCRIPT_DIR/package-lists

# Update mirrors
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist

# Update packages
sudo pacman -Syu

# Install pacman packages
while read package; do
  sudo pacman -S "$package" --needed --noconfirm
done <$PACKAGE_LISTS/pacman.txt

# Install and update yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
yay

# Install AUR packages
while read package; do
  yay -S "$package" --needed --noconfirm
done <$PACKAGE_LISTS/aur.txt

# Install LazyVim
mv ~/.config/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Enable installed services
sudo systemctl enable --now bluetooth
sudo ufw enable

# Copy dotfiles
sudo cp -a $SCRIPT_DIR/config/root/. /
cp -a $SCRIPT_DIR/config/user/. ~

# Create user directories
mkdir ~/Downloads ~/Documents ~/Pictures ~/Music ~/Git
