#!/usr/bin/env bash

setup_services() {
    info "Setting up services..."
    
    # Source init abstractions
    source "${DOTFILES_DIR}/scripts/install/init/detect-init.sh"
    source "${DOTFILES_DIR}/scripts/install/init/common.sh"
    
    detect_init
    load_init_backend
    
    enable_service "wireplumber" "user"
    enable_service "pipewire-pulse" "user"
    enable_service "pipewire" "user"
    
    ok "Audio services configured for $INIT_SYSTEM."
}
