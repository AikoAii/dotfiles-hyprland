#!/usr/bin/env bash

# runit backend

enable_service() {
    local service="$1"
    local level="${2:-system}" # system or user
    
    if [[ "$level" == "user" ]]; then
        warn "runit does not natively handle user services out-of-the-box."
        warn "Enabling $service system-wide instead."
    fi
    
    # Symlink from /etc/sv to /var/service
    if [[ -d "/etc/sv/${service}" ]]; then
        sudo ln -sf "/etc/sv/${service}" "/var/service/"
        sudo sv start "${service}" 2>/dev/null || true
    else
        warn "Service directory /etc/sv/${service} not found."
    fi
}

start_service() {
    local service="$1"
    sudo sv start "${service}" 2>/dev/null || true
}

restart_service() {
    local service="$1"
    sudo sv restart "${service}" 2>/dev/null || true
}

stop_service() {
    local service="$1"
    sudo sv stop "${service}" 2>/dev/null || true
}
