<!-- <p align="center">
  <img src=".meta/assets/banner.png" width="100%">
</p> -->

<h1 align="center">Aiko Hyprland Dotfiles</h1>

<p align="center">
  Modular Hyprland environment for Arch & Artix Linux with cross-init support.
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#preview">Preview</a> •
  <a href="#installation">Installation</a> •
  <a href="#keybindings">Keybindings</a>
</p>

---

## What is Aiko Hyprland?

A clean, modular, and keyboard-driven Hyprland environment focused on productivity, maintainability, and aesthetics.

Built around a Wayland-native workflow with a distro-aware installation system and cross-init compatibility for Arch and Artix Linux.

---

## Features

* Modular Hyprland configuration
* Cross-init support (systemd, OpenRC, runit, dinit)
* Distro-aware dependency management
* Dynamic symlink installer
* Automatic configuration backup system
* Catppuccin Mocha ecosystem
* Wayland-native workflow
* Safe modular installation architecture

---

## Preview

Screenshots and previews will be added soon.

---

## Components

* **Window Manager** — Hyprland
* **Bar** — Waybar
* **Launcher** — Fuzzel / Rofi Wayland
* **Terminal** — Kitty
* **Shell** — Fish / Zsh
* **Notifications** — SwayNC & Mako
* **OSD** — SwayOSD
* **System Utilities** — Fastfetch, Btop, Cava
* **File Manager** — Yazi
* **Audio Stack** — PipeWire + WirePlumber

---

## Supported Distributions

* Arch Linux
* Artix Linux
* Fedora (experimental)

Artix support includes OpenRC, runit, and dinit abstractions.

---

## Installation

The installer automatically:

* Detects your distribution
* Installs required dependencies
* Creates backups of existing configurations
* Applies symlinks safely
* Configures services dynamically
* Reloads supported runtime components

```bash
git clone https://github.com/AikoAii/dotfiles-hyprland.git ~/.config/dotfiles

cd ~/.config/dotfiles

chmod +x install.sh

./install.sh
```

Existing configurations are automatically backed up before installation.

Arch and Artix users are recommended to install an AUR helper such as `yay` or `paru`.

---

## Repository Structure

```text
configs/    → Application configurations
scripts/    → Installers and utility scripts
packages/   → Distribution package manifests
themes/     → Shared palettes and UI resources
docs/       → Additional documentation
.meta/      → GitHub branding assets
```

---

## Keybindings

The workflow is heavily keyboard-driven around the `SUPER` modifier.

See:

* `docs/keybinds.md`
* `SUPER + SHIFT + /`

---

## Installer Features

* Official & AUR package separation
* Cross-init service abstraction
* Safe symlink orchestration
* Runtime reload support
* Non-destructive installation flow

---

## Status

Public beta release.

Bug reports, feedback, and pull requests are welcome.

---

## Credits

* Hyprland
* Catppuccin
* Waybar
* Fuzzel
* Kitty

---

## License

MIT
