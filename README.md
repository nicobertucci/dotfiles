## Part 1: Archinstall

Install Arch with archinstall.

Choose the following options:
  1. Type: Desktop  
  2. Desktop enviroment: KDE Plasma
  3. Greeter: SSMD
  4. Audio: Pipewire
  5. Network Configuration: use NetworkManager


## Part 2: Dotfiles & Environment Deployment

Boot into KDE Plasma.

### 1. Install AUR Helper (`yay`)

```bash
sudo pacman -S --needed git base-devel
git clone [https://aur.archlinux.org/yay.git](https://aur.archlinux.org/yay.git) /tmp/yay
cd /tmp/yay && makepkg -si --noconfirm
cd ~ && rm -rf /tmp/yay
```
### 2. Clone Dotfiles (Bare Repository)
Set up the bare Git repository directly into `$HOME`:

```bash
git clone --bare https://github.com/nicobertucci/dotfiles.git $HOME/.dotfiles

# Define temporary alias for checkout
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Back up any initial skeleton configs that would cause checkout conflicts
mkdir -p ~/.config-backup
dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} ~/.config-backup/{}

# Check out tracked files
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### 3. Restore Packages via Bootstrap Script
Make the included bootstrap script executable and run it to install all repository and AUR packages:

```bash
chmod +x ~/.local/bin/bootstrap.sh
~/.local/bin/bootstrap.sh
```

### 4. Apply Desktop Settings

#### For Niri (Wayland)
Set Fish as your default shell if desired:

```bash
chsh -s (which fish)
```

#### For KDE Plasma 6 (Optional Desktop Snapshot)

```bash
konsave -i ~/.config/kde-profile.knsv
konsave -a my-kde-setup
```

Now restart and choose in SSMD niri as Desktop Manager. Alternativly KDE is installed for the case that Niri doesn`t work.
