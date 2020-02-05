#!/usr/bin/env bash

set -e

# Stop popping sound produce by Audio driver
# https://www.tonymacx86.com/threads/stop-the-popping-in-high-sierra.202355/

intallAudioService() {
    local INSTALL_TARGET="/Library/LaunchDaemons"
    local AUDIO_SERVICE="./Library/LaunchDaemons/com.msi.audio.plist"

    sudo cp "$AUDIO_SERVICE" "$INSTALL_TARGET"

    if [ -f "$AUDIO_SERVICE" ]; then
        sudo launchctl load "$AUDIO_SERVICE"
    fi

    return 1
}

main() {
    intallAudioService
}

# Execute Main
main;
