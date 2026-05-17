#!/usr/bin/env bash

backup_existing_configs() {
    info "Backing up existing configurations..."
    
    local BACKUP_DIR="${HOME}/.config.bak-$(date +%Y%m%d%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    local configs=(
        "hypr" "waybar" "rofi" "kitty" "mako" "fish" "zsh"
        "btop" "cava" "fastfetch" "tmux" "wlogout" "yazi"
        "starship.toml" "atuin" "fuzzel" "nvim"
    )
    
    for conf in "${configs[@]}"; do
        if [ -e "${HOME}/.config/${conf}" ]; then
            info "Backing up ${conf}..."
            mv "${HOME}/.config/${conf}" "${BACKUP_DIR}/"
        fi
    done
    
    ok "Backup created at $BACKUP_DIR"
}
