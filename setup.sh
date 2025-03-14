#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: You must run this script as root or with sudo."
    exit 1
fi

INSTALL_PATH="/usr/local/bin/epitest"
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd -P )"

if [ ! -f "$SCRIPT_DIR/epitest" ]; then
    echo "Error: 'epitest' script not found in the current directory."
    echo "Please make sure the 'epitest' script is in the same directory as the installer."
    exit 1
fi

echo -e "Installing 'epitest'...\n"

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

echo -e "'epitest' has been ${GREEN}successfully installed (or overwritten)${NC} !\n"
echo "You can now run your project tests by using the following command:"
echo "  epitest <command>"
echo "Example: epitest ./a.out"
echo
echo -e "To uninstall, simply run: ${YELLOW}sudo rm /usr/local/bin/epitest${NC}"
echo -e "and remove the 'epitest' script from this directory.\n"
