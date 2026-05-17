#!/usr/bin/env bash

# systemd backend

enable_service() {
    local service="$1"
    local level="${2:-system}" # system or user
    
    if [[ "$level" == "user" ]]; then
        systemctl --user enable --now "${service}" 2>/dev/null || true
    else
        sudo systemctl enable --now "${service}" 2>/dev/null || true
    fi
}

start_service() {
    local service="$1"
    local level="${2:-system}"
    
    if [[ "$level" == "user" ]]; then
        systemctl --user start "${service}" 2>/dev/null || true
    else
        sudo systemctl start "${service}" 2>/dev/null || true
    fi
}

restart_service() {
    local service="$1"
    local level="${2:-system}"
    
    if [[ "$level" == "user" ]]; then
        systemctl --user restart "${service}" 2>/dev/null || true
    else
        sudo systemctl restart "${service}" 2>/dev/null || true
    fi
}

stop_service() {
    local service="$1"
    local level="${2:-system}"
    
    if [[ "$level" == "user" ]]; then
        systemctl --user stop "${service}" 2>/dev/null || true
    else
        sudo systemctl stop "${service}" 2>/dev/null || true
    fi
}
