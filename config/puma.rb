# frozen_string_literal: true
# ============================================================================
# PUMA WEB SERVER CONFIGURATION
# ============================================================================
# This file configures Puma, the Rails application server.
# Documentation: https://puma.io/puma/Puma/DSL.html
#
# PRODUCTION DEPLOYMENT:
# - Managed by systemd service: /etc/systemd/system/puma-mrdbid.service
# - Socket: /opt/mrdbid/shared/tmp/sockets/puma.sock
# - PID file: /opt/mrdbid/shared/tmp/pids/puma.pid
# - Logs: /opt/mrdbid/shared/log/puma_stdout.log and puma_stderr.log
#
# TROUBLESHOOTING PRODUCTION ISSUES:
# - Check service status: sudo systemctl status puma-mrdbid.service
# - View logs: sudo journalctl -xeu puma-mrdbid.service
# - Restart: sudo systemctl restart puma-mrdbid.service
# - Check stderr: tail -f /opt/mrdbid/shared/log/puma_stderr.log
#
# ⚠️  CRITICAL: Puma is controlled by systemd in production (not Capistrano)
# See config/deploy.rb lines 56-117 for systemd management tasks
# ============================================================================

# ============================================================================
# THREADING CONFIGURATION
# ============================================================================
# Puma uses threads to handle concurrent requests within each process.
#
# IMPORTANT: Database connection pool MUST be >= thread count
# See config/database.yml line 15: pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
#
# Production uses 3 threads per worker as a balance between:
# - Throughput (more threads = more concurrent requests)
# - Latency (too many threads = GVL contention in CRuby)
#
# ⚠️  WARNING: If you increase threads, also increase database pool size
# ============================================================================
threads_count = ENV.fetch('RAILS_MAX_THREADS', 3)
threads threads_count, threads_count

# ============================================================================
# PRODUCTION vs DEVELOPMENT CONFIGURATION
# ============================================================================
# Production: Uses Unix socket (faster, more secure)
# Development: Uses TCP port 3000 (easier debugging)
# ============================================================================
if ENV['RAILS_ENV'] == 'production'
  # Use absolute paths in production - required by systemd service
  bind "unix://#{ENV['PUMA_SOCKET'] || '/opt/mrdbid/shared/tmp/sockets/puma.sock'}"

  # Set up pid and state files for process management
  pidfile ENV['PUMA_PID'] || '/opt/mrdbid/shared/tmp/pids/puma.pid'
  state_path ENV['PUMA_STATE'] || '/opt/mrdbid/shared/tmp/pids/puma.state'

  # Logging - redirects stdout/stderr to log files
  stdout_redirect ENV['PUMA_STDOUT'] || '/opt/mrdbid/shared/log/puma_stdout.log',
                  ENV['PUMA_STDERR'] || '/opt/mrdbid/shared/log/puma_stderr.log', true
else
  port ENV.fetch('PORT', 3000)
end

# ============================================================================
# RESTART PLUGIN
# ============================================================================
# Allows `bin/rails restart` command to work by touching tmp/restart.txt
# Puma monitors this file and gracefully restarts when it changes
# ============================================================================
plugin :tmp_restart

# ============================================================================
# SOLID QUEUE PLUGIN - OPTIONAL
# ============================================================================
# Runs the Solid Queue background job supervisor inside Puma process.
# This is for single-server deployments where you don't want a separate process.
#
# ⚠️  CRITICAL: Only enable if ENV['SOLID_QUEUE_IN_PUMA'] is set
# Default: DISABLED (Solid Queue runs separately or not at all)
#
# TO ENABLE ON PRODUCTION:
# 1. Add to /opt/mrdbid/shared/.env: SOLID_QUEUE_IN_PUMA=true
# 2. Restart Puma: sudo systemctl restart puma-mrdbid.service
# 3. Verify in logs: grep "solid_queue" /opt/mrdbid/shared/log/puma_stdout.log
#
# NOTE: This requires Solid Queue database to be set up (see production.rb)
# ============================================================================
plugin :solid_queue if ENV['SOLID_QUEUE_IN_PUMA']

# Specify the PID file. Defaults to tmp/pids/server.pid in development.
# In other environments, only set the PID file if requested.
pidfile ENV['PIDFILE'] if ENV['PIDFILE']
