# Solid Queue Setup for MRDBID Production

## Purpose
Solid Queue handles background jobs for async email delivery, preventing login/registration delays caused by synchronous SMTP operations.

## Configuration

### Option A: Run Solid Queue Inside Puma (Recommended - Rails 8 Standard)

**Advantage**: Simpler setup, one process to manage
**Disadvantage**: Worker threads share Puma's resources

**Setup**:
1. Edit `/etc/systemd/system/puma-mrdbid.service`
2. Add this line under `[Service]`:
   ```ini
   Environment="SOLID_QUEUE_IN_PUMA=1"
   ```
3. Reload and restart:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart puma-mrdbid.service
   ```

### Option B: Separate Solid Queue Service (More Robust)

**Advantage**: Dedicated resources for background jobs
**Disadvantage**: Additional service to manage

**Setup**:
1. Create `/etc/systemd/system/solid-queue-mrdbid.service`:
   ```ini
   [Unit]
   Description=Solid Queue Worker for MRDBID
   After=network.target

   [Service]
   Type=simple
   User=wrj
   WorkingDirectory=/opt/mrdbid/current
   Environment="RAILS_ENV=production"
   Environment="RAILS_LOG_TO_STDOUT=1"
   ExecStart=/opt/mrdbid/current/bin/jobs
   Restart=always
   RestartSec=5

   [Install]
   WantedBy=multi-user.target
   ```

2. Enable and start:
   ```bash
   sudo systemctl enable solid-queue-mrdbid.service
   sudo systemctl start solid-queue-mrdbid.service
   ```

## Verification

Check if workers are running:
```bash
# Option A (in Puma):
ps aux | grep solid_queue

# Option B (separate service):
sudo systemctl status solid-queue-mrdbid.service
```

Check queue tables (should have records being processed):
```bash
cd /opt/mrdbid/current
bin/rails runner "puts SolidQueue::Job.count" -e production
```

## Troubleshooting

### Jobs not processing
- Verify worker process is running (see Verification above)
- Check logs: `/opt/mrdbid/shared/log/production.log`
- For Option A: Check puma logs for solid_queue errors

### Emails not sending
- Verify Devise mailer config in `config/initializers/devise.rb`:
  ```ruby
  config.mailer = 'DeviseMailer'
  ```
- Check `app/mailers/application_mailer.rb` has:
  ```ruby
  self.delivery_job = ActionMailer::MailDeliveryJob
  ```
- Check production.rb has:
  ```ruby
  config.action_mailer.deliver_later_queue_name = :mailers
  config.active_job.queue_adapter = :async
  ```

## Current Setup
**Status**: Using Option A (SOLID_QUEUE_IN_PUMA)
**Configured**: 2025-10-30
**Purpose**: Async email delivery for registration confirmations, password resets, 2FA, etc.
