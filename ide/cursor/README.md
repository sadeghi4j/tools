# Cursor AI IDE Linux Installer

A robust and user-friendly installation script for Cursor AI IDE on Linux systems. This script automates the installation process, ensuring proper system integration and desktop environment setup.

## 🌟 Features

- Automatic system integration
- Proper desktop entry creation
- Icon management
- Clean uninstallation option
- Support for both system-wide and user-specific installations

## 📋 Requirements

- Any Linux distribution (Ubuntu, Debian, Fedora, openSUSE, Arch Linux, etc.)
- sudo privileges (for system-wide installation)
- Cursor AppImage file (universal Linux package)

## 🚀 Installation

### 📥 Step 1: Download Cursor AppImage
Since Cursor IDE doesn't provide a constant download link for the latest version, you'll need to:

1. Visit the [official Cursor website](https://cursor.sh)
2. Click on "Download" and select the Linux AppImage version
3. Save the downloaded file (it should be named something like `Cursor-*.AppImage`)

### ⚙️ Step 2: Download the Installer Script
```bash
# Download the script
curl -O https://github.com/sadeghi4j/tools/ide/cursor/install-cursor.sh

# Make it executable
chmod +x install-cursor.sh
```

### 🎯 Step 3: Install Cursor 
Run the installer with the path to your downloaded AppImage:
```bash
./install-cursor.sh /path/to/your/downloaded/Cursor-*.AppImage
```

For example, if you downloaded the AppImage to your Downloads folder:
```bash
# Install Cursor
./install-cursor.sh ~/Downloads/Cursor-*.AppImage
```

## 🗑️ Uninstallation

To uninstall Cursor, simply run:
```bash
# Uninstall Cursor
./install-cursor.sh --uninstall
```

## 🔧 How It Works

The script performs the following operations:

1. Copies the AppImage to `/opt/cursor.appimage`
2. Downloads and sets up the application icon
3. Creates desktop entries in both system and user directories
4. Updates the desktop database
5. Sets proper permissions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

This is an unofficial installer script. Cursor AI IDE is a product of Cursor Inc.

