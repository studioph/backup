#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

case "$1" in
  restic)
    BIN="restic"
    CMD="self-update"
    ;;
  rclone)
    BIN="rclone"
    CMD="selfupdate"
    ;;
  *)
    echo "Usage: $0 {restic|rclone}"
    exit 1
    ;;
esac

BIN_DIR="${2:-/usr/local/bin}"
BIN_PATH="$BIN_DIR/$BIN"

function self-update() {
  "$BIN_PATH" "$CMD"
  chown root:backup "$BIN_PATH"
  chmod 750 "$BIN_PATH"
  setcap cap_dac_read_search=+ep "$BIN_PATH"
}

self-update