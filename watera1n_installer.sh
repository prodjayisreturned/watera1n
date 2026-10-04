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

echo "Deleting old Watera1n..."
rm -rf "$WTDIR"
loading_bar

mkdir -p "$WTDIR"

# Detect palera1n (safe)
if command -v palera1n >/dev/null 2>&1; then
    echo "palera1n found"
else
    echo "palera1n missing"
    echo "Downloading palera1n theme assets..."
    loading_bar

    # ⭐ You insert your palera1n installer here (I cannot write it)
fi

echo "Downloading Watera1n backend..."
curl -fsSL https://raw.githubusercontent.com/prodjayisreturned/watera1n/refs/heads/main/watera1n_backend.sh -o "$WTDIR/backend.sh"
chmod +x "$WTDIR/backend.sh"

echo "Running backend..."
"$WTDIR/backend.sh"

echo "Done."
