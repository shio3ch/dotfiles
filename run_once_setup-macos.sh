#!/bin/bash
set -e

echo "=== Configuring macOS settings ==="
defaults write com.apple.finder AppleShowAllFiles TRUE
echo "  Finder: Show hidden files"
killall Finder
echo "  Finder: Restarted to apply settings"
echo "Done."
