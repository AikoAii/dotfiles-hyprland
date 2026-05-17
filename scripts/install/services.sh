#!/usr/bin/env bash

setup_services() {
    info "Setting up services..."
    
    if command -v systemctl &> /dev/null; then
        systemctl --user enable --now wireplumber.service pipewire-pulse.service pipewire.service 2>/dev/null || true
        ok "Systemd services enabled."
    else
        warn "systemd not found. If using dinit or OpenRC, please enable pipewire services manually."
    fi
}
