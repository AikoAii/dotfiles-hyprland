# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] — 2026-05-17

### Added
- Modular Hyprland Lua configuration (0.55+)
- Catppuccin Mocha theme across all applications
- Waybar with custom system monitoring modules
- Universal init system support (systemd, dinit, OpenRC, runit)
- Automated installer with distro and init detection
- Pre-flight validation checks
- Shared script helper library (`scripts/utils/lib.sh`)
- TPM-managed tmux plugin system
- CI shellcheck workflow
- GitHub issue and PR templates
- Package lists for Arch, Artix, and Fedora

### Changed
- Restructured repository into `configs/`, `scripts/`, `packages/`, `docs/`
- Replaced hardcoded `~/.config/AikoAi/` paths with `~/.local/bin/` symlinks
- Replaced vendored tmux plugins with TPM declarations
- Optimized Waybar polling intervals for lower CPU usage
- Delayed non-critical startup applets for faster boot

### Removed
- Duplicate Waybar config from `configs/hypr/waybar/`
- Vendored tmux plugin source trees (~150 files)
- Empty placeholder directories
- All hardcoded usernames and machine-specific paths

### Security
- Sanitized all personal identifiers from configs
- Added `.env.example` for machine-specific variables
- Updated `.gitignore` to prevent credential leakage
