#!/usr/bin/env bash

# openrc backend

enable_service() {
    local service="$1"
    local level="${2:-system}" # system or user
    
    if [[ "$level" == "user" ]]; then
        warn "OpenRC does not natively handle user services out-of-the-box."
        warn "Enabling $service system-wide instead."
    fi
    sudo rc-update add "${service}" default 2>/dev/null || true
    sudo rc-service "${service}" start 2>/dev/null || true
}

start_service() {
    local service="$1"
    sudo rc-service "${service}" start 2>/dev/null || true
}

restart_service() {
    local service="$1"
    sudo rc-service "${service}" restart 2>/dev/null || true
}

stop_service() {
    local service="$1"
    sudo rc-service "${service}" stop 2>/dev/null || true
}
