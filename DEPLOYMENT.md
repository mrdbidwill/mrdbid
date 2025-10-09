# Production Deployment Guide

## Prerequisites

- Docker and Docker Compose installed on production server
- Domain name pointing to your server
- SSL certificates (Let's Encrypt recommended)
- Access to server via SSH

## Quick Start

### 1. Clone Repository on Production Server

```bash
git clone <your-repo-url> /var/www/mrdbid
cd /var/www/mrdbid
```

### 2. Set Up Environment Variables

```bash
# Copy the example file
cp .env.production.example .env.production

# Edit with your actual values
nano .env.production
```

**Required environment variables:**

```bash
# Generate strong passwords
MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
MYSQL_PASSWORD=$(openssl rand -base64 32)

# Get from config/master.key
RAILS_MASTER_KEY=$(cat config/master.key)

# Generate new secret key base
SECRET_KEY_BASE=$(docker-compose run --rm web rails secret)

# Generate OTP encryption key
OTP_SECRET_ENCRYPTION_KEY=$(openssl rand -hex 32)

# Set your domain
APP_HOST=mrbid.com
```

### 3. Configure SSL Certificates

#### Option A: Use Let's Encrypt (Recommended)

```bash
# Install certbot
sudo apt-get update
sudo apt-get install certbot

# Get certificates
sudo certbot certonly --standalone -d mrbid.com -d www.mrbid.com

# Update docker-compose.prod.yml to mount real certificates
# Uncomment these lines in the nginx service:
# - /etc/letsencrypt/live/mrbid.com/fullchain.pem:/etc/nginx/ssl/cert.pem:ro
# - /etc/letsencrypt/live/mrbid.com/privkey.pem:/etc/nginx/ssl/key.pem:ro
```

#### Option B: Use Self-Signed Certificates (Development/Testing Only)

The nginx container includes self-signed certificates for initial setup.
**Do not use in production!**

### 4. Build and Start Services

```bash
# Build all containers
docker-compose -f docker-compose.prod.yml build --build-arg RAILS_MASTER_KEY=$(cat config/master.key)

# Start services
docker-compose -f docker-compose.prod.yml up -d

# Check status
docker-compose -f docker-compose.prod.yml ps
```

### 5. Set Up Database

```bash
# Create databases
docker-compose -f docker-compose.prod.yml exec web rails db:create

# Run migrations
docker-compose -f docker-compose.prod.yml exec web rails db:migrate

# (Optional) Seed data
docker-compose -f docker-compose.prod.yml exec web rails db:seed
```

### 6. Verify Deployment

```bash
# Check logs
docker-compose -f docker-compose.prod.yml logs -f web

# Test health endpoint
curl https://your domain.com/up

# Should return: "OK"
```

## Architecture

```
Internet
    ↓
Nginx (Port 80/443) - SSL Termination
    ↓
Rails App (Port 3000) - Internal
    ↓
MySQL (Port 3306) - Internal
```

### Services:

- **nginx**: Reverse proxy with SSL termination
- **web**: Rails application server
- **db**: MySQL 8.0 database

### Security Features:

✅ SSL/TLS encryption (HTTPS)
✅ Database passwords via environment variables
✅ No exposed database ports
✅ Health checks for all services
✅ Non-root user in Rails container
✅ Host authorization configured
✅ Force SSL enabled

## Common Tasks

### View Logs

```bash
# All services
docker-compose -f docker-compose.prod.yml logs -f

# Specific service
docker-compose -f docker-compose.prod.yml logs -f web
docker-compose -f docker-compose.prod.yml logs -f nginx
```

### Run Rails Console

```bash
docker-compose -f docker-compose.prod.yml exec web rails console
```

### Run Database Migrations

```bash
docker-compose -f docker-compose.prod.yml exec web rails db:migrate
```

### Restart Services

```bash
# Restart all
docker-compose -f docker-compose.prod.yml restart

# Restart specific service
docker-compose -f docker-compose.prod.yml restart web
```

### Update Application

```bash
# Pull latest code
git pull origin main

# Rebuild and restart
docker-compose -f docker-compose.prod.yml build --build-arg RAILS_MASTER_KEY=$(cat config/master.key)
docker-compose -f docker-compose.prod.yml up -d

# Run migrations if needed
docker-compose -f docker-compose.prod.yml exec web rails db:migrate
```

### Database Backup

```bash
# Backup
docker-compose -f docker-compose.prod.yml exec db mysqldump -u root -p$MYSQL_ROOT_PASSWORD mrdbid_production > backup_$(date +%Y%m%d).sql

# Restore
docker-compose -f docker-compose.prod.yml exec -T db mysql -u root -p$MYSQL_ROOT_PASSWORD mrdbid_production < backup_20250101.sql
```

## Monitoring

### Health Checks

All services have health checks configured:

```bash
# Check service health
docker-compose -f docker-compose.prod.yml ps
```

Services should show "healthy" status.

### Application Health Endpoint

```bash
curl https://yourdomain.com/up
```

Should return: `OK`

## Troubleshooting

### Service Won't Start

```bash
# Check logs
docker-compose -f docker-compose.prod.yml logs web

# Common issues:
# - Missing environment variables
# - Database connection failed
# - Asset precompilation failed
```

### Database Connection Errors

```bash
# Verify database is running
docker-compose -f docker-compose.prod.yml ps db

# Check database logs
docker-compose -f docker-compose.prod.yml logs db

# Test database connection
docker-compose -f docker-compose.prod.yml exec web rails db:version
```

### Assets Not Loading

```bash
# Verify assets were precompiled
docker-compose -f docker-compose.prod.yml exec web ls -la public/assets

# If missing, rebuild with asset precompilation
docker-compose -f docker-compose.prod.yml build --no-cache
```

### SSL Certificate Issues

```bash
# Check nginx configuration
docker-compose -f docker-compose.prod.yml exec nginx nginx -t

# Verify certificates are mounted
docker-compose -f docker-compose.prod.yml exec nginx ls -la /etc/nginx/ssl/
```

## Security Checklist

- [ ] Strong, unique passwords generated for all services
- [ ] `.env.production` file created and secured (chmod 600)
- [ ] SSL certificates installed and configured
- [ ] Database port not exposed externally
- [ ] Rails force_ssl enabled
- [ ] Host authorization configured with your domain
- [ ] `config/master.key` not in git repository
- [ ] Regular backups configured
- [ ] Monitoring/alerting set up
- [ ] Log aggregation configured

## Performance Optimization

### Enable Redis Caching (Optional)

Add Redis service to `docker-compose.prod.yml`:

```yaml
redis:
  image: redis:7-alpine
  restart: unless-stopped
  volumes:
    - redis-data:/data
  networks:
    - app-network
```

Update Rails config to use Redis cache.

### Configure CDN (Optional)

For better asset delivery, consider using a CDN like:
- Cloudflare
- AWS CloudFront
- Fastly

## Maintenance

### Update Dependencies

```bash
# Update Ruby gems
docker-compose -f docker-compose.prod.yml exec web bundle update

# Update JavaScript packages
docker-compose -f docker-compose.prod.yml exec web npm update

# Rebuild and redeploy
docker-compose -f docker-compose.prod.yml build
docker-compose -f docker-compose.prod.yml up -d
```

### Renew SSL Certificates

Let's Encrypt certificates expire after 90 days:

```bash
# Renew certificates
sudo certbot renew

# Restart nginx to pick up new certificates
docker-compose -f docker-compose.prod.yml restart nginx
```

Set up automatic renewal with cron:

```bash
# Add to crontab
0 0 * * * certbot renew --quiet && docker-compose -f /var/www/mrdbid/docker-compose.prod.yml restart nginx
```

## Support

For issues or questions:
1. Check logs: `docker-compose -f docker-compose.prod.yml logs -f`
2. Review this documentation
3. Check application health: `curl https://yourdomain.com/up`

## Version Info

- Ruby: 3.4.3
- Rails: 8.0+
- MySQL: 8.0
- Nginx: Alpine (latest)
- Docker Compose: V2
