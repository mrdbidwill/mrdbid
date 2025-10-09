# Production Deployment Checklist

## ✅ Pre-Deployment

### Security
- [ ] All hardcoded credentials removed from codebase
- [ ] `.env.production` file created with strong passwords
- [ ] `config/master.key` confirmed in `.gitignore`
- [ ] SSL certificates obtained (Let's Encrypt or other)
- [ ] Host authorization configured with production domain
- [ ] Force SSL enabled in production config

### Environment Setup
- [ ] Production server provisioned
- [ ] Docker and Docker Compose installed
- [ ] Domain DNS pointing to server
- [ ] Firewall configured (ports 80, 443 open)
- [ ] SSH access configured

### Configuration Files
- [ ] `.env.production` created from `.env.production.example`
- [ ] All environment variables filled in:
  - [ ] `MYSQL_ROOT_PASSWORD` (generated strong password)
  - [ ] `MYSQL_PASSWORD` (generated strong password)
  - [ ] `RAILS_MASTER_KEY` (from config/master.key)
  - [ ] `SECRET_KEY_BASE` (generated with `rails secret`)
  - [ ] `OTP_SECRET_ENCRYPTION_KEY` (generated with `openssl rand -hex 32`)
  - [ ] `APP_HOST` (your production domain)

## ✅ Deployment Steps

### 1. Server Preparation
- [ ] Clone repository to server
- [ ] Copy environment files
- [ ] Secure file permissions (`chmod 600 .env.production`)
- [ ] Install SSL certificates
- [ ] Update nginx config with certificate paths

### 2. Build Containers
```bash
docker-compose -f docker-compose.prod.yml build --build-arg RAILS_MASTER_KEY=$(cat config/master.key)
```
- [ ] Build completed without errors
- [ ] Asset precompilation successful
- [ ] All dependencies installed

### 3. Database Setup
```bash
docker-compose -f docker-compose.prod.yml up -d db
docker-compose -f docker-compose.prod.yml exec web rails db:create
docker-compose -f docker-compose.prod.yml exec web rails db:migrate
```
- [ ] Database created successfully
- [ ] All migrations run without errors
- [ ] Database accessible from Rails

### 4. Start All Services
```bash
docker-compose -f docker-compose.prod.yml up -d
```
- [ ] All services started
- [ ] All health checks passing
- [ ] No errors in logs

## ✅ Post-Deployment Verification

### Application Testing
- [ ] Website accessible via HTTPS
- [ ] HTTP redirects to HTTPS
- [ ] SSL certificate valid (no browser warnings)
- [ ] Health endpoint responding: `curl https://yourdomain.com/up`
- [ ] User registration works
- [ ] User login works
- [ ] Email delivery works (confirmations, password resets)
- [ ] Database operations work (CRUD operations)
- [ ] File uploads work
- [ ] All critical features tested

### Performance
- [ ] Assets loading from /assets/ path
- [ ] CSS/JS files compressed and fingerprinted
- [ ] Images loading correctly
- [ ] Page load times acceptable (< 2s)
- [ ] No JavaScript errors in browser console

### Security Verification
- [ ] HTTPS enforced (HTTP→HTTPS redirect working)
- [ ] Security headers present:
  ```bash
  curl -I https://yourdomain.com | grep -E "Strict-Transport-Security|X-Frame-Options|X-Content-Type-Options"
  ```
- [ ] Database port not accessible externally
- [ ] Admin pages require authentication
- [ ] User data protected by authorization policies

### Monitoring Setup
- [ ] Log aggregation configured
- [ ] Error tracking enabled (Sentry/Rollbar)
- [ ] Uptime monitoring configured
- [ ] SSL certificate expiry monitoring
- [ ] Disk space monitoring
- [ ] Database backup cron job set up

## ✅ Documentation

- [ ] Deployment process documented
- [ ] Environment variables documented
- [ ] Backup/restore procedures documented
- [ ] Emergency contacts listed
- [ ] Rollback procedure documented

## ✅ Backup Strategy

### Automated Backups
- [ ] Database backup script created
- [ ] Cron job for daily backups configured
- [ ] Backup retention policy defined (e.g., keep 7 daily, 4 weekly)
- [ ] Backup restoration tested
- [ ] Backups stored off-server (S3, separate backup server)

### Manual Backup
```bash
# Create backup now
docker-compose -f docker-compose.prod.yml exec db mysqldump -u root -p$MYSQL_ROOT_PASSWORD mrdbid_production > backup_$(date +%Y%m%d_%H%M%S).sql

# Test restore on separate environment
```
- [ ] Initial backup created
- [ ] Backup file verified (not empty, not corrupted)
- [ ] Restore tested on staging/development

## ✅ Maintenance Planning

### Regular Tasks
- [ ] Weekly: Review application logs
- [ ] Monthly: Update dependencies
- [ ] Every 60 days: Renew SSL certificates (if manual)
- [ ] Quarterly: Security audit
- [ ] Annually: Review and update documentation

### Monitoring Alerts
- [ ] Uptime < 99.9%
- [ ] Response time > 2s
- [ ] Error rate > 1%
- [ ] Disk usage > 80%
- [ ] Memory usage > 90%
- [ ] SSL certificate expires in < 30 days

## ✅ Emergency Procedures

### Rollback Plan
```bash
# Stop current deployment
docker-compose -f docker-compose.prod.yml down

# Checkout previous version
git checkout <previous-stable-tag>

# Rebuild and start
docker-compose -f docker-compose.prod.yml build
docker-compose -f docker-compose.prod.yml up -d

# Rollback database if needed
docker-compose -f docker-compose.prod.yml exec -T db mysql -u root -p$MYSQL_ROOT_PASSWORD mrdbid_production < backup_last_good.sql
```
- [ ] Rollback procedure tested
- [ ] Team knows how to execute rollback
- [ ] Previous stable version tagged in git

### Contacts
- [ ] DevOps/System Admin: ________________
- [ ] Database Admin: ________________
- [ ] Application Developer: ________________
- [ ] On-call rotation defined

## ✅ Compliance & Legal

- [ ] Privacy policy updated
- [ ] Terms of service current
- [ ] GDPR compliance verified (if applicable)
- [ ] Data retention policies implemented
- [ ] User data export functionality working
- [ ] User data deletion functionality working

## 🎯 Final Sign-Off

- [ ] All checklist items completed
- [ ] Production environment tested end-to-end
- [ ] Team trained on deployment procedures
- [ ] Documentation reviewed and approved
- [ ] Stakeholders notified of deployment

**Deployed by:** ________________
**Date:** ________________
**Version/Commit:** ________________
**Approved by:** ________________

---

## Notes

Use this space to document any deployment-specific notes, issues encountered, or deviations from standard procedure:

```
[Add your notes here]
```

---

## Quick Reference Commands

```bash
# View logs
docker-compose -f docker-compose.prod.yml logs -f

# Restart services
docker-compose -f docker-compose.prod.yml restart

# Rails console
docker-compose -f docker-compose.prod.yml exec web rails console

# Database migrations
docker-compose -f docker-compose.prod.yml exec web rails db:migrate

# Check service health
docker-compose -f docker-compose.prod.yml ps

# Backup database
docker-compose -f docker-compose.prod.yml exec db mysqldump -u root -p$MYSQL_ROOT_PASSWORD mrdbid_production > backup.sql
```
