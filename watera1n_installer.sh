#!/bin/sh

WTDIR="$HOME/Watera1n"

loading_bar() {
    BAR=""
    for i in $(seq 1 30); do
        BAR="$BAR#"
        printf "\r[%s]" "$BAR"
        sleep 0.05
    done
    echo ""
}

echo ""
echo "==============================="
echo "      Watera1n Installer"
echo "==============================="
echo ""

# === DELETE OLD WATERA1N ===
if [ -d "$WTDIR" ]; then
    echo "Found existing Watera1n installation"
    echo "Deleting..."
    loading_bar
    rm -rf "$WTDIR"
    echo "✔ Old Watera1n removed"
else
    echo "No previous Watera1n installation found"
fi

mkdir -p "$WTDIR"

# === CHECK FOR PALERA1N ===
if command -v palera1n >/dev/null 2>&1; then
    echo ""
    echo "✔ palera1n detected"
    PAL_THEME="palera1n"
else
    echo ""
    echo "✘ palera1n not found"
    echo "Installing palera1n..."
    loading_bar

    # ⭐ YOUR EXACT REQUESTED COMMAND
    /bin/sh -c "$(curl -fsSL https://static.palera.in/scripts/install.sh)"

    PAL_THEME="palera1n"
    echo "✔ palera1n installed"
fi

echo ""
echo "Downloading Watera1n backend..."
curl -fsSL https://raw.githubusercontent.com/prodjayisreturned/watera1n/refs/heads/main/watera1n_backend.sh -o "$WTDIR/backend.sh"
chmod +x "$WTDIR/backend.sh"

echo "Running backend..."
"$WTDIR/backend.sh" "$PAL_THEME"

echo ""
echo "✔ Watera1n installation complete"
echo "Location: $WTDIR"
echo ""
