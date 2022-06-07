#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

BACKUP_SOURCE="$1"

restic backup "$BACKUP_SOURCE" --exclude-file "$BACKUP_SOURCE/.config/backup/restic.exclude" --one-file-system
rclone sync "$RESTIC_REPOSITORY" "$RCLONE_REMOTE"