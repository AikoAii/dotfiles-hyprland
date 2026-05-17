# Hyprland Dotfiles

> A clean, modular, and keyboard-driven Hyprland configuration designed for maximum productivity and aesthetics.

![Hyprland Preview](https://via.placeholder.com/800x450.png?text=Hyprland+Preview)

## Features

- **Window Manager**: Hyprland (Wayland)
- **Status Bar**: Waybar (with custom Catppuccin styling)
- **Application Launcher**: Rofi (Wayland-native fork) / Fuzzel
- **Terminal**: Kitty with Fish/Zsh integration
- **Notifications**: SwayNC & Mako
- **OSD**: SwayOSD for volume and brightness
- **System Information**: Fastfetch, Btop
- **File Manager**: Yazi (CLI)
- **Theme**: Catppuccin Mocha aesthetic across all applications
- **Audio**: Pipewire + Wireplumber

## Dependencies

See the [packages](./packages) directory for explicit dependency lists based on your distribution:
- [Arch Linux](./packages/arch.txt)
- [Artix Linux](./packages/artix.txt)
- [Fedora](./packages/fedora.txt)

## Installation

We provide a safe, modular installation script that will backup your existing configurations before applying the new ones.

```bash
git clone https://github.com/AikoAii/dotfiles-hyprland.git ~/.config/dotfiles

cd ~/.config/dotfiles

chmod +x install.sh

./install.sh
```

## Supported Distributions

- Arch Linux
- Artix Linux
- Fedora (experimental)

> Artix support includes OpenRC, runit, and dinit abstractions.
> Arch and Artix users are recommended to install an AUR helper such as `yay` or `paru`.

For a detailed manual installation, please refer to the [Installation Guide](docs/installation.md).

##  Keybindings

The configuration uses a heavily keyboard-focused workflow based around the `SUPER` modifier.

For a full list of keybindings, see the [Keybindings Guide](docs/keybinds.md) or press `SUPER + SHIFT + /` to view them in the UI.

## Repository Structure

- `configs/` — All application configurations (Hyprland, Waybar, Rofi, etc.)
- `scripts/` — Utility scripts, theme managers, and installers
- `assets/` — Wallpapers, icons, and fonts
- `themes/` — Shared color palettes and UI resources
- `packages/` — Dependency lists for various distributions

## Credits

- [Hyprland](https://hyprland.org)
- [Catppuccin](https://catppuccin.com)
