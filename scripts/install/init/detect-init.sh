#!/usr/bin/env bash
# Detect active init system

detect_init() {
    # If systemctl exists and init is systemd
    if command -v systemctl >/dev/null 2>&1 && systemctl is-system-running >/dev/null 2>&1; then
        export INIT_SYSTEM="systemd"
        return
    fi
    
    # Check pid 1
    local init_bin
    init_bin=$(readlink -f /sbin/init || echo "")
    
    if [[ "$init_bin" == *"systemd"* ]] || [[ -d /run/systemd/system ]]; then
        export INIT_SYSTEM="systemd"
    elif [[ "$init_bin" == *"dinit"* ]] || command -v dinitctl >/dev/null 2>&1; then
        export INIT_SYSTEM="dinit"
    elif [[ "$init_bin" == *"openrc"* ]] || [[ -f /run/openrc/softlevel ]] || command -v rc-service >/dev/null 2>&1; then
        export INIT_SYSTEM="openrc"
    elif [[ "$init_bin" == *"runit"* ]] || command -v sv >/dev/null 2>&1; then
        export INIT_SYSTEM="runit"
    else
        # Fallback to checking comm
        local comm
        comm=$(cat /proc/1/comm 2>/dev/null || echo "")
        case "$comm" in
            systemd) export INIT_SYSTEM="systemd" ;;
            dinit) export INIT_SYSTEM="dinit" ;;
            init|openrc*) export INIT_SYSTEM="openrc" ;;
            runit) export INIT_SYSTEM="runit" ;;
            *) export INIT_SYSTEM="unknown" ;;
        esac
    fi
    
    info "Detected Init System: $INIT_SYSTEM"
}
