# Deployment Troubleshooting Guide

**Key takeaway for future chats:** When you see `ActiveSupport::MessageEncryptor::InvalidMessage` during deployment, the server's master.key is wrong. Replace it with `ed125d4dcb62fe61fea5ab987cb6e30b` - don't modify any code files.

## Error: ActiveSupport::MessageEncryptor::InvalidMessage during deployment

### Root Cause
The server's `master.key` file doesn't match the `credentials.yml.enc` file, preventing Rails from decrypting credentials during asset precompilation.

### Solution
Replace the server's master.key with the correct production key:

```bash
# The correct production key (from SERVER_BACKUP_INSTRUCTIONS_10_13_2025.md line 24)
echo "ed125d4dcb62fe61fea5ab987cb6e30b" | ssh root@85.31.233.192 "cat > /opt/mrdbid/shared/config/master.key && chmod 600 /opt/mrdbid/shared/config/master.key"

# Then deploy
cap production deploy

# Restart Puma
cap production puma:restart
```

### Verification Steps
Before attempting fixes, verify the issue:

```bash
# 1. Check what master.key is on the server
ssh root@85.31.233.192 "cat /opt/mrdbid/shared/config/master.key"

# 2. Should output: ed125d4dcb62fe61fea5ab987cb6e30b
# 3. If different, replace it using the command above
```

### What NOT to Do
- ❌ Don't modify `database.yml` to remove credentials calls
- ❌ Don't modify `config/environments/production.rb` SMTP settings
- ❌ Don't add skip logic for asset precompilation
- ❌ Don't change `config/importmap.rb`

### Key Facts
1. The production credentials file (`config/credentials/production.yml.enc`) contains SMTP settings and `secret_key_base` - NOT database credentials
2. Database credentials come from `/opt/mrdbid/shared/.env` file on the server
3. The error happens during `rake assets:precompile` when Rails initializes and tries to decrypt credentials
4. The master.key must match the encryption key used to create credentials.yml.enc

### Files That Should NOT Be Modified
- `config/database.yml` - Already correct, uses ENV variables with credentials as optional fallback
- `config/deploy.rb` - Already correct
- `config/environments/production.rb` - Already correct
- `config/importmap.rb` - Already correct

### Current Working State (as of commit 7af37d5)
- Database config uses: `ENV.fetch("MYSQL_USER")` with ENV variables from `.env` file
- SMTP config uses: `Rails.application.credentials.dig(:smtp, :address)` from encrypted credentials
- Master key on server: `ed125d4dcb62fe61fea5ab987cb6e30b`
- Server .env file has all database credentials

### If Deployment Still Fails After Key Fix
1. SSH to server and test credentials manually:
   ```bash
   ssh root@85.31.233.192
   cd /opt/mrdbid/current
   RAILS_ENV=production bin/rails runner "puts Rails.application.credentials.dig(:smtp, :address)"
   # Should output: smtp.hostinger.com
   ```

2. If that fails, check file permissions:
   ```bash
   ls -la /opt/mrdbid/shared/config/master.key
   # Should be: -rw------- (600)

   ls -la /opt/mrdbid/shared/config/credentials.yml.enc
   # Should be: -rw-r--r-- (644)
   ```

3. Verify symlinks:
   ```bash
   ls -la /opt/mrdbid/current/config/master.key
   # Should point to: /opt/mrdbid/shared/config/master.key
   ```

## Summary
**The issue is always a mismatched master.key on the server. Fix the key, don't modify the code.**
