#!/usr/bin/env bash

install_dependencies() {
    info "Installing Dependencies..."
    
    if [[ "$OS_ID" == "arch" || "$OS_LIKE" == *"arch"* || "$OS_ID" == "artix" ]]; then
        if ! command -v yay &> /dev/null && ! command -v paru &> /dev/null; then
            warn "AUR helper (yay/paru) not found. Some packages might fail."
            HELPER="sudo pacman"
        else
            HELPER=$(command -v yay || command -v paru)
        fi
        
        info "Using package manager: $HELPER"
        $HELPER -S --needed --noconfirm - < "${DOTFILES_DIR}/packages/arch.txt" || error "Failed to install dependencies"
    elif [[ "$OS_ID" == "fedora" || "$OS_LIKE" == *"fedora"* ]]; then
        info "Using package manager: dnf"
        sudo dnf install -y $(cat "${DOTFILES_DIR}/packages/fedora.txt") || error "Failed to install dependencies"
    else
        warn "Unsupported OS for automatic dependencies. Please install manually."
    fi
    ok "Dependencies installed."
}
