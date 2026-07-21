# app/controllers/admin/database_exports_controller.rb
require 'open3'

module Admin
  class DatabaseExportsController < Admin::ApplicationController
  skip_after_action :verify_policy_scoped, only: :export, raise: false

  BASE_EXCLUDED_TABLES = [
    'users',
    'trusted_devices',
    'user_roles',
    'roles',
    'role_permissions',
    'permissions',
    'invitation_tokens',
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
    'solid_queue_recurring_tasks',
    'solid_queue_scheduled_executions',
    'solid_queue_semaphores',
    'schema_migrations',
    'ar_internal_metadata'
  ].freeze

  USER_OWNED_TABLES = [
    'admin_todos',
    'all_groups',
    'articles',
    'clusters',
    'comments'
  ].freeze

  MUSHROOM_DATA_TABLES = [
    'all_group_mushrooms',
    'cluster_mushrooms',
    'genus_mushrooms',
    'image_mushrooms',
    'mr_character_mushroom_colors',
    'mr_character_mushrooms',
    'mushroom_comparisons',
    'mushroom_plants',
    'mushroom_projects',
    'mushroom_species',
    'mushroom_trees',
    'mushrooms',
    'user_recent_observations'
  ].freeze

  def self.sample_mushroom_exports(sample_id:, character_ids:)
    sample_id = Integer(sample_id)
    character_ids = character_ids.map { |id| Integer(id) }
    color_filter = character_ids.any? ? "mr_character_mushroom_id IN (#{character_ids.join(',')})" : '0 = 1'

    {
      'mushrooms' => "id = #{sample_id}",
      'genus_mushrooms' => "mushroom_id = #{sample_id}",
      'mushroom_species' => "mushroom_id = #{sample_id}",
      'mushroom_trees' => "mushroom_id = #{sample_id}",
      'mushroom_plants' => "mushroom_id = #{sample_id}",
      'mr_character_mushrooms' => "mushroom_id = #{sample_id}",
      'mr_character_mushroom_colors' => color_filter
    }
  end

  def export
    authorize :database_export, :export?

    export_type = params[:export_type] || 'lookup_tables'

    Rails.logger.info "Database export started by user #{current_user.id} - type: #{export_type}"

    # Configure export based on type
    case export_type
    when 'lookup_tables'
      # Option 1: Lookup/reference tables plus one sample mushroom.
      excluded_tables = BASE_EXCLUDED_TABLES + USER_OWNED_TABLES + MUSHROOM_DATA_TABLES
      include_only_tables = nil
      filename_prefix = 'mrdbid_lookup_tables'
      include_sample_mushroom = true
    when 'lookup_no_mblist'
      # Option 2: Lookup/reference tables without the large mb_lists table, plus one sample mushroom.
      excluded_tables = BASE_EXCLUDED_TABLES + USER_OWNED_TABLES + MUSHROOM_DATA_TABLES + ['mb_lists']
      include_only_tables = nil
      filename_prefix = 'mrdbid_lookup_no_mblist'
      include_sample_mushroom = true
    when 'mblist_only'
      # Option 3: Only the mb_lists table
      excluded_tables = []
      include_only_tables = ['mb_lists']
      filename_prefix = 'mrdbid_mblist_only'
      include_sample_mushroom = false
    else
      raise "Invalid export_type: #{export_type}"
    end

    # Database configuration
    config = ActiveRecord::Base.connection_db_config.configuration_hash
    database = config[:database]
    username = config[:username]
    password = config[:password]
    host = config[:host] || 'localhost'

    Rails.logger.info "Exporting database: #{database} from host: #{host}"

    # Build mysqldump command options based on export type
    if include_only_tables
      # For mblist_only: only export specified tables
      Rails.logger.info "Including only tables: #{include_only_tables.join(', ')}"
    else
      # For other exports: exclude specified tables
      Rails.logger.info "Excluding #{excluded_tables.length} tables"
    end

    # Create filename with timestamp
    timestamp = Time.current.strftime('%Y%m%d_%H%M%S')
    filename = "#{filename_prefix}_#{timestamp}.sql"

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
      if include_only_tables
        # For include_only: specify tables directly after database name
        commands = [[
          'mysqldump',
          "--defaults-file=#{config_file.path}",
          database,
          *include_only_tables
        ]]
      else
        # For exclusions: use --ignore-table options
        ignore_tables = excluded_tables.map { |table| "--ignore-table=#{database}.#{table}" }
        commands = [[
          'mysqldump',
          "--defaults-file=#{config_file.path}",
          *ignore_tables,
          database
        ]]
      end

      if include_sample_mushroom
        sample_id = Mushroom.order(:id).pick(:id)
        character_ids = sample_id ? MrCharacterMushroom.where(mushroom_id: sample_id).pluck(:id) : []
        sample_exports = sample_id ? self.class.sample_mushroom_exports(sample_id: sample_id, character_ids: character_ids) : {}
        Rails.logger.info "Appending sample mushroom #{sample_id} and related lightweight rows"
        sample_exports.each do |table, where_clause|
          commands << [
            'mysqldump',
            "--defaults-file=#{config_file.path}",
            '--no-create-info',
            '--skip-triggers',
            "--where=#{where_clause}",
            database,
            table
          ]
        end
      end

      Rails.logger.info "Executing mysqldump command for export type: #{export_type}"

      # Execute mysqldump and capture output
      stdout = +"#{export_instructions_header(export_type)}\n"
      stderr = +""
      commands.each_with_index do |command, index|
        command_stdout, command_stderr, status = Open3.capture3(*command)

        unless status.success?
          error_msg = "mysqldump failed with exit code #{status.exitstatus}: #{command_stderr}"
          Rails.logger.error error_msg
          raise error_msg
        end

        stdout << "\n\n-- MRDBID sample mushroom data\n" if include_sample_mushroom && index == 1
        stdout << command_stdout
        stderr << command_stderr
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

      # Schedule cleanup after 7 days
      CleanupExportJob.set(wait: 7.days).perform_later(final_path.to_s) if defined?(CleanupExportJob)

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

  private

  def export_instructions_header(export_type)
    sample_note =
      if export_type == 'mblist_only'
        'This MBList-only export does not include users or sample mushroom data.'
      else
        'This lookup export includes one sample mushroom so public pages are not empty, while avoiding a large, irrelevant specimen-data dump.'
      end

    <<~SQL
      -- MRDBID public database export
      -- Export type: #{export_type}
      --
      -- Security note:
      -- This file intentionally does not include real users, passwords, trusted devices,
      -- roles, permissions, invitation tokens, or other security tables.
      --
      -- After importing this SQL file into a fresh MRDBID installation, create your own
      -- login accounts with this Rails task. Replace the email addresses and passwords:
      --
      --   RAILS_ENV=production \\
      --   ADMIN_EMAIL=admin@example.com ADMIN_PASSWORD='change-this-admin-password' \\
      --   REGULAR_EMAIL=user@example.com REGULAR_PASSWORD='change-this-user-password' \\
      --   bin/rails mrdbid:setup_users
      --
      -- Passwords must be at least 12 characters. Do not reuse these example values.
      -- If you create only an admin account, omit REGULAR_EMAIL and REGULAR_PASSWORD.
      --
      -- #{sample_note}
    SQL
  end
  end
end
