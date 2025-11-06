# app/controllers/admin/database_exports_controller.rb
class Admin::DatabaseExportsController < Admin::ApplicationController
  skip_after_action :verify_policy_scoped, only: :export

  def export
    authorize :database_export, :export?

    # Tables to exclude for security reasons
    excluded_tables = [
      'users',
      'trusted_devices',
      'user_roles',
      'roles',
      'role_permissions',
      'permissions',
      'versions',
      'active_storage_attachments',
      'active_storage_blobs',
      'active_storage_variant_records',
      'solid_queue_blocked_executions',
      'solid_queue_claimed_executions',
      'solid_queue_failed_executions',
      'solid_queue_jobs',
      'solid_queue_pauses',
      'solid_queue_processes',
      'solid_queue_ready_executions',
      'solid_queue_recurring_executions',
      'solid_queue_scheduled_executions',
      'solid_queue_semaphores',
      'schema_migrations',
      'ar_internal_metadata'
    ]

    # Database configuration
    config = ActiveRecord::Base.connection_db_config.configuration_hash
    database = config[:database]
    username = config[:username]
    password = config[:password]
    host = config[:host] || 'localhost'

    # Build mysqldump command with excluded tables
    ignore_tables = excluded_tables.map { |table| "--ignore-table=#{database}.#{table}" }.join(' ')

    # Create filename with timestamp
    timestamp = Time.current.strftime('%Y%m%d_%H%M%S')
    filename = "mrdbid_export_#{timestamp}.sql"

    # Create temporary file
    temp_file = Tempfile.new([filename, '.sql'])

    begin
      # Build mysqldump command
      password_option = password.present? ? "-p#{password}" : ""
      command = "mysqldump -h #{host} -u #{username} #{password_option} #{ignore_tables} #{database} > #{temp_file.path}"

      # Execute mysqldump
      system(command)

      unless $?.success?
        raise "Database export failed"
      end

      # Send file to user
      send_file temp_file.path,
                filename: filename,
                type: 'application/sql',
                disposition: 'attachment'
    rescue => e
      Rails.logger.error "Database export error: #{e.message}"
      redirect_to admin_root_path, alert: "Failed to export database: #{e.message}"
    ensure
      # Clean up temp file after sending
      temp_file.close
      temp_file.unlink
    end
  end
end
