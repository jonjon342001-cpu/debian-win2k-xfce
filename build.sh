#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt update
apt install -y live-build debian-archive-keyring

lb clean

lb config \
  --mode debian \
  --distribution bookworm \
  --debian-installer live \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --mirror-bootstrap http://deb.debian.org/debian \
  --mirror-chroot http://deb.debian.org/debian \
  --mirror-binary http://deb.debian.org/debian \
  --iso-application "Debian Windows 2000 Clone" \
  --iso-publisher "Win2k Linux Project"

lb build
