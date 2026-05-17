#!/usr/bin/env bash
set -euo pipefail


run() {
    if ! pgrep -fx "$*" >/dev/null 2>&1; then
        "$@" &
    fi
}

# Audio
run pipewire
run pipewire-pulse
run wireplumber

# DBus
dbus-update-activation-environment --all

# Wallpaper
(run awww-daemon --format xrgb && wallpaper-set "$(readlink -f ~/.local/share/wallpapers/current)") &

# Clipboard
run wl-paste --type text --watch cliphist store
run wl-paste --type image --watch cliphist store

# Core UI
run swaync
run swayosd-server
(sleep 1 && waybar) &

# Applets (Delayed to improve initial render time)
(sleep 2 && run nm-applet) &
(sleep 2 && run blueman-applet) &

# Hypr ecosystem
run hypridle

# Security
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
