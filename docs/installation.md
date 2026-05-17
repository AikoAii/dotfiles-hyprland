# Installation Guide

Follow these steps to manually install the AikoAi dotfiles, or to understand what the automated installer does.

## 1. Install Dependencies

Ensure you have installed all the necessary packages for your distribution. See the `packages/` directory for the exact lists.

For Arch Linux:
```bash
yay -S --needed - < packages/arch.txt
```

## 2. Backup Existing Configurations

Always backup your existing configs before applying new ones:
```bash
mkdir -p ~/.config.bak
mv ~/.config/hypr ~/.config.bak/
mv ~/.config/waybar ~/.config.bak/
# Repeat for other configs...
```

## 3. Clone and Symlink

Clone the repository to a permanent location (e.g., `~/.config/dotfiles`):
```bash
git clone https://github.com/chikochi/dotfiles-hyprland.git ~/.config/dotfiles
```

Then, symlink the configs to your `~/.config/` directory:
```bash
ln -sf ~/.config/dotfiles/configs/hypr ~/.config/hypr
ln -sf ~/.config/dotfiles/configs/waybar ~/.config/waybar
# Repeat for other directories in configs/
```

## 4. Install Scripts and Assets

Symlink the scripts to `~/.local/bin/` so they are available in your `$PATH`:
```bash
mkdir -p ~/.local/bin
ln -sf ~/.config/dotfiles/scripts/system/* ~/.local/bin/
ln -sf ~/.config/dotfiles/scripts/themes/* ~/.local/bin/
# ...
```

Copy the fonts to `~/.local/share/fonts/` and rebuild the font cache:
```bash
mkdir -p ~/.local/share/fonts
cp -r ~/.config/dotfiles/assets/fonts/* ~/.local/share/fonts/
fc-cache -fv
```

## 5. Start Hyprland

Log out of your current session and start Hyprland from your Display Manager (SDDM, GDM, etc.) or run `Hyprland` from a TTY.
