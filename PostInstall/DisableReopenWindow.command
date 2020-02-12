#!/usr/bin/env bash

set -e

echo -e "Disable 'Reopen windows when loggin back' in feature:\n";

# Ask sudo upfront
sudo -v

# Resetting immutable flag if have set before
`find ~/Library/Preferences/ByHost/ -name 'com.apple.loginwindow*' -exec sudo chflags nouchg {} \;`

echo -n "Removing state from com.apple.loginwindow..."
`find ~/Library/Preferences/ByHost/ -name 'com.apple.loginwindow*' ! -size 0 -exec sudo tee {} \; < /dev/null`
echo "		[DONE]"

echo -n "Set the user immutable flag on com.apple.loginwindow..."
`find ~/Library/Preferences/ByHost/ -name 'com.apple.loginwindow*' -exec sudo chflags uimmutable {} \;`
echo "	[DONE]"
