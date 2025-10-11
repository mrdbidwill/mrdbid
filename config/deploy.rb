# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "mrdbid"
set :repo_url, "git@github.com:mrdbidwill/mrdbid.git"

set :branch, "main"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/opt/mrdbid"

set :rbenv_type, :user
set :rbenv_ruby, '3.4.3'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/master.key", ".env.production"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"

# Default value for default_env is {}
set :default_env, {
  'MYSQL_USER' => 'mrdbid_user',
  'MYSQL_PASSWORD' => 'uR!TxC4avEWp',
  'MYSQL_DATABASE' => 'mrdbid_production',
  'DB_HOST' => '127.0.0.1',
  'DATABASE_URL' => 'mysql2://mrdbid_user:uR!TxC4avEWp@127.0.0.1/mrdbid_production'
}

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
