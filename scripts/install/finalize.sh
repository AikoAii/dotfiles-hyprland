#!/usr/bin/env bash

finalize_install() {
    info "Finalizing installation..."

    # --- Reload Hyprland ---
    if pgrep -x "Hyprland" >/dev/null; then

        if command -v hyprctl >/dev/null 2>&1; then

            hyprctl reload \
                >/dev/null 2>&1 \
                || warn "Failed to reload Hyprland"

            info "Hyprland reloaded."

        else
            warn "hyprctl not found. Skipping Hyprland reload."
        fi
    fi

    # --- Reload Waybar ---
    if pgrep -x "waybar" >/dev/null; then

        if command -v killall >/dev/null 2>&1; then

            killall -SIGUSR2 waybar \
                >/dev/null 2>&1 \
                || warn "Failed to reload Waybar"

            info "Waybar reloaded."

        else
            warn "killall not found. Skipping Waybar reload."
        fi
    fi

    ok "Finalization complete."
}
