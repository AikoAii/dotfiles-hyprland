#!/usr/bin/env bash

create_symlinks() {
    info "Creating symlinks..."
    
    mkdir -p "${HOME}/.config"
    mkdir -p "${HOME}/.local/bin"
    
    # Symlink configs
    for conf in "${DOTFILES_DIR}/configs/"*; do
        local target="${HOME}/.config/$(basename "$conf")"
        if [ ! -e "$target" ]; then
            ln -sf "$conf" "$target"
            info "Symlinked $(basename "$conf")"
        fi
    done
    
    # Symlink scripts to ~/.local/bin
    for script_dir in "${DOTFILES_DIR}/scripts/"*; do
        if [ -d "$script_dir" ] && [ "$(basename "$script_dir")" != "install" ]; then
            for script in "$script_dir"/*; do
                if [ -f "$script" ]; then
                    local target="${HOME}/.local/bin/$(basename "$script")"
                    ln -sf "$script" "$target"
                    info "Symlinked script $(basename "$script")"
                fi
            done
        fi
    done
    
    ok "Symlinks created."
}
