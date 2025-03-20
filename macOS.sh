#!/bin/bash

# File for macOS ONLY

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Check if XQuartz is installed (to be able to use "xhost")
if [ ! -d "/Applications/Utilities/XQuartz.app" ]; then

    echo -e "${YELLOW}XQuartz is not installed.${NC}"

    if ! command -v brew &> /dev/null; then
        echo -e "${YELLOW}Homebrew is not installed${NC}. Please install Homebrew first, and try again."
        echo -e "You can install Homebrew by visiting: ${YELLOW}https://brew.sh${NC}"
        exit 1
    fi

    echo -e "Installing XQuartz via Homebrew...\n"

    if brew install --cask xquartz; then
        echo -e "XQuartz has been ${GREEN}successfully installed.${NC}"
    else
        echo -e "${RED}Failed to install XQuartz${NC}. Please try again or install it manually."
        exit 1
    fi
else
    echo "XQuartz is already installed. Proceeding..."
fi


# Configuration for XQuartz
echo -e "Setting up some configuration for XQuartz...\n"

defaults write org.xquartz.X11 nolisten_tcp -bool false
defaults write org.xquartz.X11 no_auth -bool false
defaults write org.xquartz.X11 enable_iglx -bool true

mkdir -p ~/.xinitrc.d

cat << 'EOF' > ~/.xinitrc.d/xhost-config.sh
#!/bin/sh

xhost +127.0.0.1
xhost +localhost
xhost +\$(hostname)
EOF

chmod +x ~/.xinitrc.d/xhost-config.sh
echo "XQuartz configuration updated."

echo -e "Finished configuring XQuartz !\n"
# End of XQuartz configuration


echo "Launching setup.sh..."
sudo ./setup.sh