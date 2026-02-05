#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

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
