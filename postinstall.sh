### Arch I3 Postinstall ###

# Get script directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Update mirrors
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist

# Update packages
sudo pacman -Syu

# Install pacman packages
while read package; do
  sudo pacman -S "$package" --needed --noconfirm
done <$SCRIPT_DIR/package-lists/pacman.txt

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
done <$SCRIPT_DIR/package-lists/aur.txt

# Install LazyVim
mv ~/.config/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Enable installed services
sudo systemctl enable --now apparmor
sudo systemctl enable --now bluetooth
sudo ufw enable

# Add apparmor to systemd boot config
sudo /bin/bash -c "echo 'options apparmor=1 security=apparmor' >> /boot/loader/entries/$(ls /boot/loader/entries/ | grep linux.conf)"

# Copy config files
sudo cp -a $SCRIPT_DIR/config/root/. /
cp -a $SCRIPT_DIR/config/user/. ~

# Create user directories
mkdir ~/Downloads ~/Documents ~/Pictures ~/Music ~/Git
