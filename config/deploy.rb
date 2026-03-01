# config valid for current version and patch releases of Capistrano
lock "~> 3.20.0"

set :application, "mrdbid"
set :repo_url, "git@github.com:mrdbidwill/mrdbid.git"

set :branch, ENV.fetch('BRANCH', 'main')
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/opt/mrdbid"

set :rbenv_type, :user
set :rbenv_ruby, '3.4.3'

# Puma configuration
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/master.key", "config/credentials.yml.enc", ".env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Use systemd to restart Puma instead of capistrano-puma's restart
after "deploy:published", "systemd_puma:restart"

# Custom tasks to manage Puma via systemd
namespace :systemd_puma do
  desc 'Install Puma systemd service'
  task :install_service do
    on roles(:app) do
      execute :sudo, :cp, "#{release_path}/config/puma.service", "/etc/systemd/system/puma-mrdbid.service"
      execute :sudo, :systemctl, "daemon-reload"
      execute :sudo, :systemctl, "enable", "puma-mrdbid.service"
    end
  end

  desc 'Fail deploy if legacy Puma units are not masked'
  task :assert_legacy_units_masked do
    on roles(:app) do
      info "Checking for legacy Puma units (must be masked or not-found)..."
      checks = {
        "puma.service" => "masked",
        "puma_auto_glossary.service" => "masked"
      }

      checks.each do |unit, required|
        status = capture(:systemctl, "is-enabled", unit, raise_on_non_zero_exit: false).strip
        next if status == required || status == "not-found"

        error "ERROR: #{unit} is #{status.inspect}. It must be #{required.inspect} or not-found."
        error "Run: sudo systemctl stop #{unit}; sudo systemctl disable #{unit}; sudo systemctl mask --force #{unit}"
        exit 1
      end
    end
  end

  desc 'Guard against duplicate Puma units (prevents socket conflicts)'
  task :guard_duplicate_units do
    on roles(:app) do
      info "Ensuring legacy Puma units are masked to avoid duplicate instances..."
      execute :sudo, :bash, "-lc", "systemctl stop puma.service || true; systemctl disable puma.service || true; systemctl mask --force puma.service || true"
      execute :sudo, :bash, "-lc", "systemctl stop puma_auto_glossary.service || true; systemctl disable puma_auto_glossary.service || true; systemctl mask --force puma_auto_glossary.service || true"
    end
  end

  desc 'Start Puma via systemd'
  task :start do
    on roles(:app) do
      execute :sudo, :systemctl, "start", "puma-mrdbid.service"
    end
  end

  desc 'Stop Puma via systemd'
  task :stop do
    on roles(:app) do
      execute :sudo, :systemctl, "stop", "puma-mrdbid.service"
    end
  end

  desc 'Restart Puma via systemd'
  task :restart do
    on roles(:app) do
      execute :sudo, :systemctl, "restart", "puma-mrdbid.service"
    end
  end

  desc 'Check Puma systemd service status'
  task :status do
    on roles(:app) do
      execute :sudo, :systemctl, "status", "puma-mrdbid.service"
    end
  end

  desc 'Show Puma systemd service logs'
  task :logs do
    on roles(:app) do
      execute :sudo, :journalctl, "-xeu", "puma-mrdbid.service", "--no-pager", "-n", "50"
    end
  end

  desc 'Show Puma stderr log file'
  task :stderr do
    on roles(:app) do
      execute :tail, "-n", "50", "#{shared_path}/log/puma_stderr.log"
    end
  end

  desc 'Show Puma stdout log file'
  task :stdout do
    on roles(:app) do
      execute :tail, "-n", "50", "#{shared_path}/log/puma_stdout.log"
    end
  end

  desc 'Verify Puma is running and responding'
  task :verify do
    on roles(:app) do
      info "Waiting 10 seconds for Puma to fully start..."
      sleep 10

      info "Checking if Puma process is running..."
      execute "ps aux | grep '[p]uma' || (echo 'ERROR: Puma process not found' && exit 1)"

      info "Checking if Puma is responding to requests..."
      # Check the Unix socket directly with retry logic
      max_attempts = 3
      attempt = 0
      success = false

      max_attempts.times do |i|
        attempt = i + 1
        begin
          execute "curl --unix-socket #{shared_path}/tmp/sockets/puma.sock http://localhost/ -f -s -o /dev/null"
          success = true
          break
        rescue SSHKit::Command::Failed
          info "Attempt #{attempt} failed..."
          sleep 2 unless attempt == max_attempts
        end
      end

      unless success
        error "ERROR: Puma not responding on socket after #{max_attempts} attempts"
        exit 1
      end

      info "✓ Puma is running and responding successfully"
    end
  end
end

# Fail early before any deploy changes if legacy units are not masked.
before "deploy:starting", "systemd_puma:assert_legacy_units_masked"

# Ensure duplicate units are blocked before restarting Puma
before "systemd_puma:restart", "systemd_puma:guard_duplicate_units"

# Add verification after restart
after "systemd_puma:restart", "systemd_puma:verify"

# Override cleanup task to ignore permission errors on bootsnap cache files
Rake::Task["deploy:cleanup"].clear_actions
namespace :deploy do
  desc 'Clean up old releases (ignore permission errors)'
  task :cleanup do
    on release_roles :all do |host|
      releases = capture(:ls, '-xtr', releases_path).split
      if releases.count >= fetch(:keep_releases)
        info t(:keeping_releases, host: host.to_s, keep_releases: fetch(:keep_releases), releases: releases.count)
        directories = (releases - releases.last(fetch(:keep_releases)))
        if directories.any?
          directories.each do |release|
            # Delete each directory individually and ignore permission errors
            begin
              execute :rm, '-rf', releases_path.join(release)
            rescue SSHKit::Command::Failed => e
              # Silently ignore permission denied errors during cleanup
              warn "Some files in #{release} could not be deleted (permission denied), skipping..."
            end
          end
        else
          info t(:no_old_releases, host: host.to_s, keep_releases: fetch(:keep_releases))
        end
      end
    end
  end
end
