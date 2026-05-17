#!/usr/bin/env bash

# dinit backend

enable_service() {
    local service="$1"
    local level="${2:-system}" # system or user
    
    if [[ "$level" == "user" ]]; then
        # Check if turnstile or user-level dinit is available
        if command -v dinitctl >/dev/null 2>&1 && dinitctl --user list >/dev/null 2>&1; then
            dinitctl --user enable "${service}" 2>/dev/null || true
            dinitctl --user start "${service}" 2>/dev/null || true
        else
            warn "User-level dinit not fully configured. Assuming system-wide enable for ${service}."
            sudo dinitctl enable "${service}" 2>/dev/null || true
            sudo dinitctl start "${service}" 2>/dev/null || true
        fi
    else
        sudo dinitctl enable "${service}" 2>/dev/null || true
        sudo dinitctl start "${service}" 2>/dev/null || true
    fi
}

start_service() {
    local service="$1"
    local level="${2:-system}"
    
    if [[ "$level" == "user" ]] && dinitctl --user list >/dev/null 2>&1; then
        dinitctl --user start "${service}" 2>/dev/null || true
    else
        sudo dinitctl start "${service}" 2>/dev/null || true
    fi
}

restart_service() {
    local service="$1"
    local level="${2:-system}"
    
    if [[ "$level" == "user" ]] && dinitctl --user list >/dev/null 2>&1; then
        dinitctl --user restart "${service}" 2>/dev/null || true
    else
        sudo dinitctl restart "${service}" 2>/dev/null || true
    fi
}

stop_service() {
    local service="$1"
    local level="${2:-system}"
    
    if [[ "$level" == "user" ]] && dinitctl --user list >/dev/null 2>&1; then
        dinitctl --user stop "${service}" 2>/dev/null || true
    else
        sudo dinitctl stop "${service}" 2>/dev/null || true
    fi
}
