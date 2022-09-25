# backup
Backup configs

Restic is used to backup data from the source system via scheuled systemd services, then rclone is used to sync with an S3-like bucket/object store.
This is to avoid some of the complications and annoyances that arise out of trying to keep multiple restic repos in sync with each other.

Also included is a service to regularly self-update each binary, since OS level packages are usually very outdated.
