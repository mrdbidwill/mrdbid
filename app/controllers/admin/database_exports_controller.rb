# app/controllers/admin/database_exports_controller.rb
require 'open3'

class Admin::DatabaseExportsController < Admin::ApplicationController
  skip_after_action :verify_policy_scoped, only: :export

  def export
    authorize :database_export, :export?

    Rails.logger.info "Database export started by user #{current_user.id}"

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

    Rails.logger.info "Exporting database: #{database} from host: #{host}"

    # Build mysqldump command with excluded tables
    ignore_tables = excluded_tables.map { |table| "--ignore-table=#{database}.#{table}" }.join(' ')

    # Create filename with timestamp
    timestamp = Time.current.strftime('%Y%m%d_%H%M%S')
    filename = "mrdbid_export_#{timestamp}.sql"

    # Create temporary files
    temp_file = Tempfile.new([filename, '.sql'])
    config_file = Tempfile.new(['mysql_config', '.cnf'])

    begin
      # Write MySQL config file with credentials (more secure than command line)
      config_file.write("[client]\n")
      config_file.write("user=#{username}\n")
      config_file.write("password=#{password}\n") if password.present?
      config_file.write("host=#{host}\n")
      config_file.close

      Rails.logger.info "MySQL config file created at: #{config_file.path}"

      # Build mysqldump command using config file
      command = [
        'mysqldump',
        "--defaults-file=#{config_file.path}",
        *ignore_tables.split(' '),
        database
      ]

      Rails.logger.info "Executing mysqldump command (excluding #{excluded_tables.length} tables)"

      # Execute mysqldump and capture output
      stdout, stderr, status = Open3.capture3(*command)

      unless status.success?
        error_msg = "mysqldump failed with exit code #{status.exitstatus}: #{stderr}"
        Rails.logger.error error_msg
        raise error_msg
      end

      # Write output to temp file
      temp_file.write(stdout)
      temp_file.close

      file_size = File.size(temp_file.path)
      Rails.logger.info "Database export completed. File size: #{file_size} bytes"

      # Validate file size
      if file_size == 0
        raise "Database export produced empty file. stderr: #{stderr}"
      end

      # Move temp file to shared tmp directory for nginx to serve
      # Use shared path so files persist across deployments
      shared_tmp_dir = Rails.root.join('..', '..', 'shared', 'public', 'tmp', 'exports')
      FileUtils.mkdir_p(shared_tmp_dir)

      final_path = shared_tmp_dir.join(filename)
      FileUtils.mv(temp_file.path, final_path)
      # Set permissions so nginx can read the file
      FileUtils.chmod(0644, final_path)
      temp_file.close(true) # Close without unlinking since we moved it

      Rails.logger.info "Database export file moved to: #{final_path}"

      # Use X-Accel-Redirect for nginx to handle large file download
      # This prevents Rails timeout issues with large files
      response.headers['Content-Type'] = 'application/sql'
      response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
      response.headers['X-Accel-Redirect'] = "/tmp/exports/#{filename}"
      response.headers['X-Accel-Buffering'] = 'no'

      # Schedule cleanup after 1 hour
      CleanupExportJob.set(wait: 1.hour).perform_later(final_path.to_s) if defined?(CleanupExportJob)

      Rails.logger.info "Database export file sent to user #{current_user.id} via X-Accel-Redirect"

      render body: nil
    rescue => e
      Rails.logger.error "Database export error: #{e.class.name} - #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      redirect_to admin_root_path, alert: "Failed to export database: #{e.message}"
    ensure
      # Clean up temp files (but not the moved export file)
      begin
        config_file.unlink if config_file
        # Don't unlink temp_file here as it was moved to public/tmp/exports
        Rails.logger.info "Temp files cleaned up"
      rescue => cleanup_error
        Rails.logger.error "Error cleaning up temp files: #{cleanup_error.message}"
      end
    end
  end
end
