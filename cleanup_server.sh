#!/bin/bash
# Cleanup script for server disk space
# Run on server: ssh root@85.31.233.192 'bash -s' < cleanup_server.sh

echo "=== Server Cleanup Script ==="
echo ""

# 1. Remove Docker images and containers
echo "Cleaning Docker..."
docker system prune -af --volumes
echo ""

# 2. Clean old logs
echo "Cleaning logs..."
cd /opt/mrdbid
find log/ -name "*.log" -mtime +7 -delete
truncate -s 0 log/*.log
echo ""

# 3. Remove old Git commits/objects
echo "Cleaning Git..."
git gc --aggressive --prune=now
echo ""

# 4. Clean apt cache
echo "Cleaning apt cache..."
apt-get clean
apt-get autoclean
apt-get autoremove -y
echo ""

# 5. Remove old kernels (keep current)
echo "Removing old kernels..."
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs -r apt-get -y purge
echo ""

# 6. Clear tmp files
echo "Cleaning tmp files..."
rm -rf /tmp/*
rm -rf /opt/mrdbid/tmp/cache/*
echo ""

# 7. Check disk usage
echo "=== Disk Usage After Cleanup ==="
df -h /
echo ""

echo "=== Largest directories ==="
du -h --max-depth=1 / 2>/dev/null | sort -hr | head -10
