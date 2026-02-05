#!/bin/bash
set -e

apt update
apt install -y live-build git wget

lb clean
lb config \
  --distribution bookworm \
  --debian-installer live \
  --archive-areas "main contrib non-free non-free-firmware" \
  --desktop xfce \
  --binary-images iso-hybrid \
  --iso-application "Debian Windows 2000 Clone" \
  --iso-publisher "Win2k Linux Project"

lb build
