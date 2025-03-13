#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: You must run this script as root or with sudo."
    exit 1
fi

INSTALL_PATH="/usr/local/bin/epitest"
SCRIPT_DIR=$(dirname "$(realpath "$0")")

if [ ! -f "$SCRIPT_DIR/epitest" ]; then
    echo "Error: 'epitest' script not found in the current directory."
    echo "Please make sure the 'epitest' script is in the same directory as the installer."
    exit 1
fi

echo "Installing 'epitest'..."

cp -f "$SCRIPT_DIR/epitest" "$INSTALL_PATH" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy 'epitest' to $INSTALL_PATH."
    exit 1
fi

sudo chmod +x "$INSTALL_PATH" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to set execute permissions for 'epitest'."
    exit 1
fi

echo "'epitest' has been successfully installed (or overwritten)!"
echo "You can now run your project tests by using the following command:"
echo "  epitest <command>"
echo "Example: epitest ./a.out"
echo
echo "To uninstall, simply run: sudo rm /usr/local/bin/epitest"
echo "and remove the 'epitest' script from this directory."
