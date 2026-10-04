#!/bin/sh

WTDIR="$HOME/Watera1n"

echo ""
echo "==============================="
echo "      Watera1n Backend"
echo "==============================="
echo ""

# Argument passed from installer (palera1n path or theme asset)
PAL_THEME="$1"

echo "✔ Using theme source: $PAL_THEME"
echo ""

# === Create folders ===
mkdir -p "$WTDIR/theme"
mkdir -p "$WTDIR/config"
mkdir -p "$WTDIR/bin"

echo "✔ Created Watera1n folder structure"
echo ""

# === Copy theme asset ===
if [ -f "$PAL_THEME" ]; then
    cp "$PAL_THEME" "$WTDIR/theme/palera1n_theme_asset"
    echo "✔ Theme asset copied"
else
    echo "✘ Theme asset missing, using default"
    echo "Watera1n Default Theme" > "$WTDIR/theme/default_theme.txt"
fi

echo ""

# === Create config file ===
cat <<EOF > "$WTDIR/config/watera1n.conf"
# Watera1n Configuration
theme_source=$PAL_THEME
install_time=$(date)
EOF

echo "✔ Config created"
echo ""

# === Placeholder for your future features ===
echo "✔ Backend setup complete"
echo "✔ Watera1n is ready"
echo ""
