#!/usr/bin/env bash
set -e

echo "==> Installing official packages..."
sudo pacman -S --needed - < ~/.config/pkglist-repo.txt

echo "==> Ensuring yay is installed..."
if ! command -v yay &>/dev/null; then
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
fi

echo "==> Installing AUR packages..."
yay -S --needed - < ~/.config/pkglist-aur.txt

echo "==> Setup complete!"
