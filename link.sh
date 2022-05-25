#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

SELF_UPDATE_DIR="$PWD/self-update"
SYSTEMD_DIR=/etc/systemd/system
BINARIES=('restic' 'rclone')

function install-systemd() {
  sudo ln -s "$SELF_UPDATE_DIR/self-update@.timer" "$SYSTEMD_DIR/self-update@$1.timer"
  sudo ln -s "$SELF_UPDATE_DIR/self-update@.service" "$SYSTEMD_DIR/self-update@$1.service"
}

ln -s "$SELF_UPDATE_DIR/self-update.sh" "$HOME/.local/bin/self-update.sh"
for bin in "${BINARIES[@]}"; do
    install-systemd "$bin"
done