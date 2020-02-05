#!/usr/bin/env bash

set -e
sudo -v # ask for sudo upfront

# Stop popping sound produce by Audio driver
# https://www.tonymacx86.com/threads/stop-the-popping-in-high-sierra.202355/

# !!Do not remove main function!!
main() {
    intallAudioService
}

intallAudioService() {
    local INSTALL_TARGET="/Library/LaunchDaemons/com.msi.audio.plist"
    local AUDIO_SERVICE_NAME="com.msi.audio.plist"
    local AUDIO_SERVICE="Library/LaunchDaemons/$AUDIO_SERVICE_NAME"

    if [ -f "$INSTALL_TARGET" ]; then
        echo -n "Removing existing service..."
        launchctl unload "$INSTALL_TARGET"
        rm "$INSTALL_TARGET" >>/dev/null 2>&1
        echo " [Done]"
    fi

    echo -n "Installing new service..."
    cp "$AUDIO_SERVICE" "$INSTALL_TARGET" >>/dev/null 2>&1
    echo " [Done]"

    if [ -f "$INSTALL_TARGET" ]; then
        echo "Registering new service..."
        launchctl load "$INSTALL_TARGET"
    fi

    return 1
}

# Execute Main
main;
