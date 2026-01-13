# Deployment Checklist

## Critical Background Services

This application has **TWO** critical services that must restart after each deploy:

1. **Puma** (web server) - Automatically restarted by Capistrano
2. **Solid Queue** (background job worker) - Automatically restarted by Capistrano

### Why Both Must Restart

**Solid Queue runs background jobs with Ruby code.** If you don't restart it after deploy, it continues running OLD CODE even though new code is deployed. This causes:

- Jobs using old broken code
- Mysterious errors that "should be fixed"
- Hours of debugging the same issue repeatedly

## Deploy Process (Automated)

```bash
cap production deploy
```

This automatically:
1. Deploys new code
2. Restarts Puma web server
3. **Restarts Solid Queue worker** ← Critical for background jobs!

## Manual Restart (If Needed)

If you need to manually restart services:

```bash
# SSH to server
ssh root@85.31.233.192

# Restart Puma
sudo systemctl restart puma-mrdbid.service

# Restart Solid Queue (CRITICAL for background jobs!)
sudo systemctl restart solid-queue-mrdbid.service
```

## Verifying Background Jobs Work

After deploy, to verify Solid Queue is running with new code:

```bash
ssh root@85.31.233.192
systemctl status solid-queue-mrdbid
# Should show recent restart timestamp
```

## Common Issues

### Issue: "Background jobs still failing after deploy"
**Solution:** Restart Solid Queue: `sudo systemctl restart solid-queue-mrdbid`

### Issue: "Permission denied during cleanup"
**Status:** Known issue, safe to ignore. Cleanup fails but deploy succeeds.

### Issue: "SSH key passphrase required"
**Solution:** Add key to agent: `ssh-add ~/.ssh/id_ed25519`

## Testing Background Jobs

To test if Solid Queue is processing jobs correctly:

1. Go to website → Click "Backup My Images"
2. If it works, Solid Queue is running new code
3. If it fails with old errors, restart Solid Queue

## Files Modified for This Fix

- `config/deploy.rb` - Added automatic Solid Queue restart
- `app/jobs/user_image_export_job.rb` - Fixed image export logic
- `app/controllers/users/image_exports_controller.rb` - Fixed Pundit authorization

## Prevention Strategy

✅ **Automated** - Solid Queue now restarts automatically on every deploy
✅ **Documented** - This checklist explains the issue
✅ **Commented** - Critical code sections have warnings not to remove

**If you remove the Solid Queue restart from deploy.rb, you'll repeat these same debugging sessions.**
