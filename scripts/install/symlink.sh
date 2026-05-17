#!/usr/bin/env bash

create_symlinks() {
    info "Creating symlinks..."

    ensure_dir "${HOME}/.config"
    ensure_dir "${HOME}/.local/bin"

    # --- Symlink configs ---
    for conf in "${DOTFILES_DIR}/configs/"*; do

        local target="${HOME}/.config/$(basename "$conf")"

        safe_symlink "$conf" "$target"

        info "Symlinked $(basename "$conf")"
    done

    # --- Symlink scripts ---
    for script_dir in "${DOTFILES_DIR}/scripts/"*; do

        [[ -d "$script_dir" ]] || continue

        [[ "$(basename "$script_dir")" == "install" ]] && continue

        for script in "$script_dir"/*; do

            [[ -f "$script" && -x "$script" ]] || continue

            local target="${HOME}/.local/bin/$(basename "$script")"

            safe_symlink "$script" "$target"

            info "Symlinked script $(basename "$script")"
        done
    done

    ok "Symlinks created successfully."
}
