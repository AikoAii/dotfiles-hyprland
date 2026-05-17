#!/usr/bin/env bash

set_permissions() {
    info "Setting executable permissions for scripts..."
    
    find "${DOTFILES_DIR}/scripts" -type f -name "*.sh" -exec chmod +x {} \;
    find "${DOTFILES_DIR}/scripts" -type f -not -name "*.sh" -exec chmod +x {} \;
    
    ok "Permissions updated."
}
