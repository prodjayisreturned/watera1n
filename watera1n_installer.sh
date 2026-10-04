#!/bin/sh

WTDIR="$HOME/Waterra1n"
RAW_URL="https://raw.githubusercontent.com/prodjayisreturned/watera1n/refs/heads/main/watera1n%20installer"

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
echo "      Waterra1n Installer"
echo "==============================="
echo ""

# === DELETE OLD WATERA1N ===
if [ -d "$WTDIR" ]; then
    echo "Found existing Waterra1n installation"
    echo "Deleting..."
    loading_bar
    rm -rf "$WTDIR"
    echo "✔ Old Waterra1n removed"
else
    echo "No previous Waterra1n installation found"
fi

# === CREATE NEW FOLDER ===
mkdir -p "$WTDIR"

# === CHECK FOR PALERA1N ===
if command -v palera1n >/dev/null 2>&1; then
    echo ""
    echo "✔ palera1n detected"
    JB="palera1n"
else
    echo ""
    echo "✘ palera1n not found"
    echo "Downloading palera1n into Waterra1n..."
    loading_bar

    curl -fsSL https://static.palera.in/releases/palera1n-macos-universal -o "$WTDIR/palera1n"
    chmod +x "$WTDIR/palera1n"

    JB="$WTDIR/palera1n"
    echo "✔ palera1n installed locally"
fi

# === DOWNLOAD WATERA1N INSTALLER ===
echo ""
echo "Downloading Waterra1n installer..."
loading_bar

curl -fsSL "$RAW_URL" -o "$WTDIR/watera1n_backend.sh"
chmod +x "$WTDIR/watera1n_backend.sh"

echo "✔ Waterra1n installer downloaded"

# === RUN INSTALLER WITH JB COMMAND ===
echo ""
echo "Running Waterra1n installer..."
"$WTDIR/watera1n_backend.sh" "$JB"

echo ""
echo "✔ Waterra1n installation complete"
echo "Location: $WTDIR"
echo ""
