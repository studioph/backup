#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

PATH="$PATH:$HOME/.local/bin"

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

"$BIN" "$CMD"