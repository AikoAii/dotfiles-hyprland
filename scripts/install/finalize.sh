#!/usr/bin/env bash

finalize_install() {
    info "Finalizing installation..."
    
    # Reload Hyprland if running
    if pgrep -x "Hyprland" > /dev/null; then
        hyprctl reload || true
        info "Hyprland reloaded."
    fi
    
    if pgrep -x "waybar" > /dev/null; then
        killall -SIGUSR2 waybar || true
        info "Waybar reloaded."
    fi
    
    ok "Finalization complete."
}
