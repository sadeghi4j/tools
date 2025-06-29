# Cursor AI IDE Linux Installer

A simple yet powerful script that integrates Cursor AI IDE into your Linux system's application menu. This means you can launch Cursor just like any other application - by searching for it in your system's application launcher (Windows key + A) or finding it in your applications menu, without needing to use the terminal.

The script handles all the necessary steps to make Cursor feel like a native application on your system:
- Creates proper desktop entries
- Sets up application icons
- Integrates with your system's application menu
- Makes the Cursor easily discoverable and launchable

No more terminal commands needed to start Cursor - just click and go!

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

1. Visit the [official Cursor website](https://www.cursor.com/)
2. Click on "Download for Linux".
3. Save the downloaded file (it should be named something like `Cursor-*.AppImage`)

### ⚙️ Step 2: Download the Installer Script
This step downloads the installation script that will handle the setup process. The script is a single file that contains all the necessary commands to install Cursor IDE on your system properly.

- Download the script
```bash
curl -O https://raw.githubusercontent.com/sadeghi4j/tools/refs/heads/main/ide/cursor/install-cursor.sh
```

- Make it executable
```bash
chmod +x install-cursor.sh
```

The `chmod +x` command makes the script executable, which is required to run it. This is a standard security practice in Linux - files are not executable by default.

### 🎯 Step 3: Install Cursor 
Run the installer with the path to your downloaded AppImage:
```bash
./install-cursor.sh /path/to/your/downloaded/Cursor-*.AppImage
```

For example, if you downloaded the AppImage to your Downloads folder:
```bash
./install-cursor.sh ~/Downloads/Cursor-*.AppImage
```

## 🗑️ Uninstallation

To uninstall Cursor, simply run:
```bash
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

