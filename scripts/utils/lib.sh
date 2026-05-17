#!/usr/bin/env bash
# scripts/utils/lib.sh — Shared helper library

# ==============================================================
# Colors
# ==============================================================

if [[ -t 1 ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    BOLD='\033[1m'
    NC='\033[0m'
else
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    CYAN=''
    BOLD=''
    NC=''
fi

# ==============================================================
# Logging
# ==============================================================

info() {
    printf "%b[INFO]%b  %s\n" "$BLUE" "$NC" "$*"
}

ok() {
    printf "%b[ OK ]%b  %s\n" "$GREEN" "$NC" "$*"
}

warn() {
    printf "%b[WARN]%b  %s\n" "$YELLOW" "$NC" "$*" >&2
}

error() {
    printf "%b[ERR ]%b  %s\n" "$RED" "$NC" "$*" >&2
    exit 1
}

step() {
    printf "\n%b==> %s%b\n" "$BOLD$CYAN" "$*" "$NC"
}

# ==============================================================
# Dependency checks
# ==============================================================

require() {
    local cmd="$1"

    command -v "$cmd" >/dev/null 2>&1 \
        || error "Required command not found: ${cmd}"
}

require_any() {

    local found=1

    for cmd in "$@"; do
        if command -v "$cmd" >/dev/null 2>&1; then
            found=0
            break
        fi
    done

    [[ $found -eq 0 ]] \
        || error "None of the required commands found: $*"
}

# ==============================================================
# Desktop notifications 
# ==============================================================

notify() {

    local title="$1"
    local body="${2:-}"

    if command -v notify-send >/dev/null 2>&1; then

        notify-send "$title" "$body" \
            >/dev/null 2>&1 \
            || warn "Failed to send desktop notification"
    fi
}

# ==============================================================
# Safe file helpers
# ==============================================================

safe_symlink() {

    local src="$1"
    local dst="$2"

    [[ -e "$src" || -L "$src" ]] \
        || error "Symlink source does not exist: ${src}"

    # Backup non-symlink target
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        warn "Skipping symlink: ${dst} exists and is not a symlink"
        return 1
    fi

    ln -sfn "$src" "$dst" \
        || error "Failed to create symlink: ${dst}"
}

ensure_dir() {

    local dir="$1"

    if [[ ! -d "$dir" ]]; then

        mkdir -p "$dir" \
            || error "Failed to create directory: ${dir}"
    fi
}
