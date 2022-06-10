#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

BACKUP_SOURCE="$1"

restic backup "$BACKUP_SOURCE" --exclude-file "$BACKUP_SOURCE/.config/backup/restic.exclude" --one-file-system
restic forget --prune --keep-daily 7
rclone sync "$RESTIC_REPOSITORY" "$RCLONE_REMOTE"