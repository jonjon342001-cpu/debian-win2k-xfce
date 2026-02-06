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
  --binary-images iso-hybrid \
  --security false \
  --updates false \
  --iso-application "Debian Windows 2000 Clone" \
  --iso-publisher "Win2k Linux Project"

lb build
