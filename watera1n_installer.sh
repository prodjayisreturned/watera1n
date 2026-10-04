#!/bin/sh

WTDIR="$HOME/Watera1n"
RAW_URL="https://raw.githubusercontent.com/prodjayisreturned/watera1n/refs/heads/main/watera1n_installer.sh"

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

# === CREATE NEW FOLDER ===
mkdir -p "$WTDIR"

# === CHECK FOR PALERA1N FILES ===
PALBIN="/usr/local/bin/palera1n"

if [ -f "$PALBIN" ]; then
    echo ""
    echo "✔ palera1n detected"
    echo "Copying palera1n files into Watera1n..."
    loading_bar
    cp "$PALBIN" "$WTDIR/palera1n_theme_source"
    echo "✔ palera1n assets copied"
else
    echo ""
    echo "✘ palera1n not found"
    echo "Downloading palera1n into Watera1n..."
    loading_bar

    curl -fsSL https://static.palera.in/releases/palera1n-macos-universal -o "$WTDIR/palera1n"
    chmod +x "$WTDIR/palera1n"

    echo "✔ palera1n downloaded into Watera1n"
fi

# === DOWNLOAD WATERA1N INSTALLER ===
echo ""
echo "Downloading Watera1n installer..."
loading_bar

curl -fsSL "$RAW_URL" -o "$WTDIR/watera1n_backend.sh"
chmod +x "$WTDIR/watera1n_backend.sh"

echo "✔ Watera1n installer downloaded"

# === RUN BACKEND INSTALLER SAFELY ===
echo ""
echo "Running Watera1n backend installer..."
"$WTDIR/watera1n_backend.sh"

echo ""
echo "✔ Watera1n installation complete"
echo "Location: $WTDIR"
echo ""
