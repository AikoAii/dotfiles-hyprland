#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
TIME=$(date +%Y-%m-%d_%H-%M-%S-%N)
FILE="$DIR/$TIME.png"
TEXT="$DIR/$TIME.txt"

mkdir -p "$DIR"

notify() { notify-send "📸 Screenshot" "$1"; }
sound() { paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga 2>/dev/null; }
preview() { xdg-open "$FILE" >/dev/null 2>&1 & }

# dependency check
for cmd in grim slurp wl-copy hyprctl jq; do
    command -v $cmd >/dev/null || { notify "$cmd not found"; exit 1; }
done

# ==========================
# SMART GEOMETRY
# ==========================
get_geom() {
    GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    if [[ "$GEOM" == "0,0 0x0" || -z "$GEOM" ]]; then
        GEOM=$(slurp) || exit 0
    fi
    echo "$GEOM"
}

case "$1" in
# ==========================
# CORE
# ==========================
full)
    grim "$FILE" && sound && notify "Saved → $FILE" && preview
    ;;

region)
    GEOM=$(slurp) || exit 0
    grim -g "$GEOM" "$FILE" && sound && notify "Saved → $FILE" && preview
    ;;

copy)
    GEOM=$(slurp) || exit 0
    grim -g "$GEOM" - | wl-copy && sound && notify "Copied"
    ;;

both)
    GEOM=$(slurp) || exit 0
    grim -g "$GEOM" "$FILE" && wl-copy < "$FILE" && sound && notify "Saved + Copied" && preview
    ;;

# ==========================
# SMART
# ==========================
smart)
    GEOM=$(get_geom)
    grim -g "$GEOM" "$FILE" && sound && notify "Smart → $FILE" && preview
    ;;

smart-copy)
    GEOM=$(get_geom)
    grim -g "$GEOM" - | wl-copy && sound && notify "Smart copied"
    ;;

smart-both)
    GEOM=$(get_geom)
    grim -g "$GEOM" "$FILE" && wl-copy < "$FILE" && sound && notify "Smart saved + copied" && preview
    ;;

# ==========================
# AI (OCR + UPLOAD)
# ==========================
ai)
    GEOM=$(slurp) || exit 0
    grim -g "$GEOM" "$FILE" || exit 1

    tesseract "$FILE" "$TEXT" -l eng 2>/dev/null
    OCR=$(cat "$TEXT.txt" 2>/dev/null)

    LINK=$(curl -s -F "file=@$FILE" https://0x0.st)

    {
        echo "=== OCR TEXT ==="
        echo "$OCR"
        echo ""
        echo "=== LINK ==="
        echo "$LINK"
    } | wl-copy

    sound
    notify "AI → OCR + Link copied"
    preview
    ;;

*)
    notify "Modes: full | region | copy | both | smart | smart-copy | smart-both | ai"
    ;;
esac
