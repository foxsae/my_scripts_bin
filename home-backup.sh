#!/bin/bash
# Backup home directory to /mnt/backup/home
# Exclude large unneeded directories and dotfiles

SRC="/home/"
DEST="/mnt/backup/home/"
LOGDIR="/mnt/backup/logs"
LOGFILE="$LOGDIR/backup-$(date +'%Y%m%d-%H%M%s').log"

EXCLUDES=(
    "Apps"
    "Desktop"
    "Downloads"
    "Dropbox"
    "steam"
    ".cache"
    ".mozilla"
    ".brave"
    ".cache/"
    ".Trash-1000/"
    ".npm/"
    ".cargo/"
    ".gem/"
    ".gvfs/"
    "*.swp"
    "*.tmp"
    "*.bak"
    ".wine"
    ".zoom"
    ".steam"
    ".local/share"
)

EXCLUDE_ARGS=()
for i in "${EXCLUDES[@]}"; do
    EXCLUDE_ARGS+=(--exclude="$i")
done

# Run rsync quietly, resumable, nice CPU/I/O priority
nice -n 19 ionice -c3 rsync -a --partial --progress --log-file="$LOGFILE" "${EXCLUDE_ARGS[@]}" "$SRC" "$DEST"
