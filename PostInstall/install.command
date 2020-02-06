#!/usr/bin/env bash

set -e
sudo -v # ask for sudo upfront

BASE_DIR="$(dirname "$0")"

# Stop popping sound produce by Audio driver
# https://www.tonymacx86.com/threads/stop-the-popping-in-high-sierra.202355/

# !!Do not remove main function!!
main() {
    intallAudioService
}

intallAudioService() {
    local AUDIO_SERVICE_NAME="com.msi.audio.plist"
    local INSTALL_SOURCE="$BASE_DIR/Library/LaunchDaemons/$AUDIO_SERVICE_NAME"
    local INSTALL_TARGET="/Library/LaunchDaemons"

    if [ -f "$INSTALL_TARGET" ]; then
        echo -n "Removing existing service..."
        sudo launchctl unload "$INSTALL_TARGET"
        sudo rm "$INSTALL_TARGET" >>/dev/null 2>&1
        echo " [Done]"
    fi

    echo -n "Installing new service..."
    sudo cp "$INSTALL_SOURCE" "$INSTALL_TARGET" >>/dev/null 2>&1
    echo " [Done]"

    if [ -f "$INSTALL_TARGET" ]; then
        echo -n "Registering new service..."
        sudo launchctl load "$INSTALL_TARGET"
        echo " [Done]"
    fi

    return 1
}

# Execute Main
main;
