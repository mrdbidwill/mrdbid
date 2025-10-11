# Complete Server Cleanup

Run these commands on the server to clean everything:

```bash
ssh root@85.31.233.192
```

Then run:

```bash
# 1. Stop and remove ALL Docker
docker stop $(docker ps -aq) 2>/dev/null || true
docker rm $(docker ps -aq) 2>/dev/null || true
docker system prune -af --volumes
docker builder prune -af

# 2. Remove Docker entirely (optional but recommended)
apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
apt-get autoremove -y
rm -rf /var/lib/docker
rm -rf /var/lib/containerd

# 3. Clean logs
cd /opt/mrdbid
rm -rf log/*.log
mkdir -p log

# 4. Clean tmp files
rm -rf tmp/*
mkdir -p tmp/pids tmp/cache tmp/sockets

# 5. Clean old deploys if any exist
rm -rf releases/* 2>/dev/null || true

# 6. System cleanup
apt-get clean
apt-get autoclean
apt-get autoremove -y

# 7. Check space now
df -h /
```

This will free up ~20GB and remove all the broken Docker stuff.
