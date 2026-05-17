#!/usr/bin/env bash

set_permissions() {
    info "Setting executable permissions for scripts..."

    local scripts_dir="${DOTFILES_DIR}/scripts"

    [[ -d "$scripts_dir" ]] \
        || error "Scripts directory not found: ${scripts_dir}"

    find "$scripts_dir" \
        -type f \
        \( -name "*.sh" -o ! -name "*.*" \) \
        -exec chmod +x {} \;

    ok "Permissions updated successfully."
}
