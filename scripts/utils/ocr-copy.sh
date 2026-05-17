#!/bin/bash

TMP_IMG="/tmp/ocr_$$.png"
TMP_TXT="/tmp/ocr_$$"

notify() {
    notify-send "🧠 OCR Translate" "$1"
}

# dependency check
for cmd in grim slurp tesseract wl-copy trans; do
    command -v $cmd >/dev/null || { notify "$cmd not found"; exit 1; }
done

# select area
GEOM=$(slurp) || exit 0

# screenshot
grim -g "$GEOM" "$TMP_IMG" || exit 1

# OCR
tesseract "$TMP_IMG" "$TMP_TXT" -l eng+ind --psm 6 2>/dev/null

if [ ! -f "$TMP_TXT.txt" ]; then
    notify "OCR gagal"
    exit 1
fi

OCR_TEXT=$(cat "$TMP_TXT.txt")

# translate (ke Indonesia)
TRANSLATED=$(trans -brief :id "$OCR_TEXT")

# gabungkan hasil
{
    echo "=== ORIGINAL ==="
    echo "$OCR_TEXT"
    echo ""
    echo "=== TRANSLATE (ID) ==="
    echo "$TRANSLATED"
} | wl-copy

notify "OCR + Translate copied"

# cleanup
rm -f "$TMP_IMG" "$TMP_TXT.txt"
