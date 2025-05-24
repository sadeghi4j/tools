#!/bin/bash

# Default paths
APPIMAGE_PATH="/opt/cursor.appimage"
ICON_PATH="/opt/cursor.png"
SYSTEM_DESKTOP_ENTRY="/usr/share/applications/cursor.desktop"
USER_DESKTOP_ENTRY="$HOME/.local/share/applications/cursor.desktop"

# Check if Cursor is fully installed
isCursorInstalled() {
    [ -f "$APPIMAGE_PATH" ] && \
    [ -f "$ICON_PATH" ] && \
    [ -f "$SYSTEM_DESKTOP_ENTRY" ] && \
    [ -f "$USER_DESKTOP_ENTRY" ]
}

uninstallCursor() {
    echo "Uninstalling Cursor AI IDE..."
    sudo rm -f "$APPIMAGE_PATH" "$ICON_PATH" "$SYSTEM_DESKTOP_ENTRY"
    rm -f "$USER_DESKTOP_ENTRY"
    sudo update-desktop-database
    update-desktop-database "$HOME/.local/share/applications"
    echo "Uninstallation complete."
}

installCursor() {
    local appimage_src="$1"

    # Validate AppImage
    if [ ! -f "$appimage_src" ]; then
        echo "Error: AppImage file not found at '$appimage_src'"
        echo "Usage: $0 [path-to-downloaded-AppImage]"
        exit 1
    fi

    echo "Installing Cursor AI IDE..."

    # Copy AppImage to /opt
    echo "Copying AppImage to $APPIMAGE_PATH..."
    sudo cp "$appimage_src" "$APPIMAGE_PATH"
    sudo chmod +x "$APPIMAGE_PATH"

    # Download icon (if missing)
    if [ ! -f "$ICON_PATH" ]; then
        echo "Downloading icon..."
        sudo curl -L "https://raw.githubusercontent.com/rahuljangirwork/copmany-logos/main/cursor.png" -o "$ICON_PATH" || {
            echo "Warning: Icon download failed (using fallback)"
            sudo cp "$(dirname "$appimage_src")/cursor.png" "$ICON_PATH" 2>/dev/null || true
        }
    fi

    # Configure .desktop files
    DESKTOP_ENTRY_CONTENT="[Desktop Entry]
Name=Cursor AI IDE
Exec=\"$APPIMAGE_PATH\" --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
StartupWMClass=Cursor
"
    echo "Configuring .desktop files..."
    echo "$DESKTOP_ENTRY_CONTENT" | sudo tee "$SYSTEM_DESKTOP_ENTRY" > /dev/null
    mkdir -p "$(dirname "$USER_DESKTOP_ENTRY")"
    echo "$DESKTOP_ENTRY_CONTENT" > "$USER_DESKTOP_ENTRY"

    # Update desktop database
    sudo update-desktop-database
    update-desktop-database "$HOME/.local/share/applications"

    echo "Installation complete! Log out and back in to see Cursor in the app menu."
}

# Main logic
case "$1" in
    --uninstall)
        uninstallCursor
        ;;
    "")
        if isCursorInstalled; then
            echo "Cursor is already installed. Use '--uninstall' to remove it."
        else
            echo "Error: No AppImage path provided."
            echo "Usage: $0 [path-to-downloaded-AppImage]"
            exit 1
        fi
        ;;
    *)
        installCursor "$1"
        ;;
esac
