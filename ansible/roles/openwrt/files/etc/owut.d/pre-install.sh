#!/bin/sh
# Backup configs before `owut upgrade`.

# Backup directory (persists across upgrades).
BACKUP_DIR="/etc/owut.d/config-backup"

# Create backup directory.
mkdir -p "$BACKUP_DIR"

# Backup configs and dropbear.
echo "Backing up configs to $BACKUP_DIR"
cp -r /etc/config "$BACKUP_DIR/" || exit 1
cp -r /etc/dropbear "$BACKUP_DIR/" || exit 1

echo "Config backup completed"
exit 0
