# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

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
      execute <<~BASH
        for i in {1..3}; do
          curl --unix-socket #{shared_path}/tmp/sockets/puma.sock http://localhost/ -f -s -o /dev/null && exit 0
          echo "Attempt $i failed, waiting 2 seconds..."
          sleep 2
        done
        echo 'ERROR: Puma not responding on socket after 3 attempts'
        exit 1
      BASH

      info "✓ Puma is running and responding successfully"
    end
  end
end

# Add verification after restart
after "systemd_puma:restart", "systemd_puma:verify"
