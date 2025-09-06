#!/bin/sh
# Restore configs after `owut upgrade`.

# Backup directory.
BACKUP_DIR="/etc/owut.d/config-backup"

# Check if backup exists.
if [ ! -d "$BACKUP_DIR/config" ] || [ ! -d "$BACKUP_DIR/dropbear" ]; then
    echo "No config backup found, skipping restore"
    exit 0
fi

echo "Restoring configs from $BACKUP_DIR"

# Restore configs.
cp -r "$BACKUP_DIR/config/"* /etc/config/ || exit 1
cp -r "$BACKUP_DIR/dropbear/"* /etc/dropbear/ || exit 1

# Set proper permissions.
chmod 600 /etc/config/*
chmod 600 /etc/dropbear/*
chown -R root:root /etc/config/
chown -R root:root /etc/dropbear/

echo "Config restore completed"

# Restart services to apply restored configs.
/etc/init.d/network restart
/etc/init.d/dropbear restart
/etc/init.d/dnsmasq restart
/etc/init.d/firewall restart
/etc/init.d/system reload
/etc/init.d/uhttpd restart

exit 0
