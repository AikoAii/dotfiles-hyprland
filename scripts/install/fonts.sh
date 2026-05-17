#!/usr/bin/env bash

install_fonts() {
    info "Installing local fonts..."
    
    if [ -d "${DOTFILES_DIR}/assets/fonts" ]; then
        mkdir -p "${HOME}/.local/share/fonts"
        cp -r "${DOTFILES_DIR}/assets/fonts/"* "${HOME}/.local/share/fonts/" 2>/dev/null || true
        fc-cache -fv &> /dev/null
        ok "Local fonts installed."
    else
        warn "No local fonts found in assets/fonts."
    fi
}
