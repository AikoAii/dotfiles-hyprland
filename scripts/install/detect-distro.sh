#!/usr/bin/env bash

detect_distro() {
    info "Detecting Linux Distribution..."
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        export OS_ID=$ID
        export OS_LIKE=$ID_LIKE
        ok "Detected OS: $PRETTY_NAME"
    else
        error "Cannot detect OS! /etc/os-release not found."
    fi
}
