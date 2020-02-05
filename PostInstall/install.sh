#!/usr/bin/env bash

set -e

# Stop popping sound produce by Audio driver
# https://www.tonymacx86.com/threads/stop-the-popping-in-high-sierra.202355/

intallAudioService() {
    local INSTALL_TARGET="/Library/LaunchDaemons/com.msi.audio.plist"
    local AUDIO_SERVICE_NAME="com.msi.audio.plist"
    local AUDIO_SERVICE="Library/LaunchDaemons/$AUDIO_SERVICE_NAME"

    if [ -f "$INSTALL_TARGET" ]; then
        echo -n "Removing existing service..."
        sudo rm "$INSTALL_TARGET" >>/dev/null 2>&1
        echo " [Done]"
    fi

    echo -n "Installing new service..."
    sudo cp "$AUDIO_SERVICE" "$INSTALL_TARGET" >>/dev/null 2>&1
    echo " [Done]"

    if [ -f "$INSTALL_TARGET" ]; then
        echo "Registering new service..."
        sudo launchctl load "$INSTALL_TARGET"
    fi

    return 1
}

main() {
    intallAudioService
}

# Execute Main
main;
