### Arch I3 Postinstall ###

# Get script directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Update mirrors
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist

# Update packages
sudo pacman -Syu

# Install packages in packages.txt using pacman
while read package; do
  sudo pacman -S "$package" --needed --noconfirm
done <$SCRIPT_DIR/packages.txt

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
sudo cp -a $SCRIPT_DIR/dotfiles/root/. /
cp -a $SCRIPT_DIR/dotfiles/user/. ~
