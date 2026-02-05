#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt update
apt install -y live-build git wget

# Clean old builds
lb clean

# Configure the ISO (minimal working flags)
lb config \
  --distribution bookworm \
  --debian-installer live \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --iso-application "Debian Windows 2000 Clone" \
  --iso-publisher "Win2k Linux Project"

# Build the ISO
lb build
