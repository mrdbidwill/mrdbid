# Server Setup for Capistrano Deployment

## One-time server preparation (SSH to root@85.31.233.192)

```bash
# 1. Stop Docker containers
cd /opt/mrdbid
docker compose -f docker-compose.prod.yml down 2>/dev/null || true

# 2. Install system dependencies
apt-get update
apt-get install -y git curl libssl-dev libreadline-dev zlib1g-dev \
  autoconf bison build-essential libyaml-dev libncurses5-dev \
  libffi-dev libgdbm-dev libvips libmariadb-dev-compat \
  default-mysql-client nginx

# 3. Install rbenv for Ruby version management
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bashrc

# 4. Install Ruby 3.4.3
rbenv install 3.4.3
rbenv global 3.4.3
gem install bundler

# 5. Keep MySQL Docker container (it works fine)
docker compose up -d db  # Just the database

# 6. Verify .env.production exists with all required variables
cat /opt/mrdbid/.env.production

# 7. Create systemd service for Rails
cat > /etc/systemd/system/mrdbid.service << 'EOF'
[Unit]
Description=MRDBID Rails Application
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/mrdbid/current
Environment=RAILS_ENV=production
EnvironmentFile=/opt/mrdbid/shared/.env.production
ExecStart=/root/.rbenv/shims/bundle exec puma -C config/puma.rb
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable mrdbid
```

## Then from your LOCAL machine, run:

```bash
bundle exec cap production deploy
```

This will:
- Pull latest code from GitHub to server
- Install gems
- Precompile assets
- Run migrations
- Restart the application
