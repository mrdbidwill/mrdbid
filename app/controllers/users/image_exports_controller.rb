# frozen_string_literal: true

module Users
  class ImageExportsController < ApplicationController
    before_action :authenticate_user!

    def new
      # Show export request page
      @image_count = ImageMushroom.joins(:mushroom)
                                   .where(mushrooms: { user_id: current_user.id })
                                   .count

      if @image_count.zero?
        redirect_to root_path, alert: "You don't have any images to export."
        return
      end
    end

    def create
      # Check if user has images to export
      image_count = ImageMushroom.joins(:mushroom)
                                  .where(mushrooms: { user_id: current_user.id })
                                  .count

      if image_count.zero?
        redirect_to root_path, alert: "You don't have any images to export."
        return
      end

      # Check for recent pending export
      export_id = SecureRandom.uuid
      existing_export = check_existing_export

      if existing_export
        redirect_to users_image_export_status_path(id: existing_export[:export_id]),
                    notice: "An export is already in progress. Please wait for it to complete."
        return
      end

      # Store export request info in cache
      Rails.cache.write(
        "image_export:#{export_id}",
        {
          status: 'processing',
          user_id: current_user.id,
          created_at: Time.current
        },
        expires_in: 25.hours
      )

      # Queue the job
      UserImageExportJob.perform_later(current_user.id, export_id)

      Rails.logger.info "[ImageExportsController] Export requested by user #{current_user.id}, export_id: #{export_id}"

      redirect_to users_image_export_status_path(id: export_id),
                  notice: "Your image export has been queued. This may take several minutes depending on the number of images."
    end

    def status
      export_id = params[:id]
      @export_info = Rails.cache.read("image_export:#{export_id}")

      unless @export_info
        redirect_to root_path, alert: "Export not found or has expired."
        return
      end

      # Verify this export belongs to current user
      if @export_info[:user_id] && @export_info[:user_id] != current_user.id
        redirect_to root_path, alert: "Unauthorized access to export."
        return
      end

      @export_id = export_id
    end

    def download
      export_id = params[:id]
      export_info = Rails.cache.read("image_export:#{export_id}")

      unless export_info
        redirect_to root_path, alert: "Export not found or has expired."
        return
      end

      # Verify this export belongs to current user
      if export_info[:user_id] && export_info[:user_id] != current_user.id
        redirect_to root_path, alert: "Unauthorized access to export."
        return
      end

      unless export_info[:status] == 'ready'
        redirect_to users_image_export_status_path(id: export_id),
                    alert: "Export is not ready for download yet."
        return
      end

      filename = export_info[:filename]
      file_path = Rails.root.join('..', '..', 'shared', 'public', 'tmp', 'exports', filename)

      unless File.exist?(file_path)
        redirect_to users_image_export_status_path(id: export_id),
                    alert: "Export file not found. It may have been cleaned up."
        return
      end

      Rails.logger.info "[ImageExportsController] User #{current_user.id} downloading export: #{filename}"

      # Use X-Accel-Redirect for nginx to handle the download
      # This prevents Rails timeout issues with large files
      response.headers['Content-Type'] = 'application/zip'
      response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
      response.headers['X-Accel-Redirect'] = "/tmp/exports/#{filename}"
      response.headers['X-Accel-Buffering'] = 'no'

      render body: nil
    end

    private

    def check_existing_export
      # Check cache for any recent exports by this user that are still processing
      # This is a simple implementation - could be improved with a dedicated table
      cache_keys = Rails.cache.instance_variable_get(:@data)&.keys || []
      export_keys = cache_keys.select { |k| k.to_s.start_with?('image_export:') }

      export_keys.each do |key|
        export_data = Rails.cache.read(key)
        if export_data &&
           export_data[:user_id] == current_user.id &&
           export_data[:status] == 'processing' &&
           export_data[:created_at] > 10.minutes.ago
          return { export_id: key.to_s.sub('image_export:', ''), export_data: export_data }
        end
      end

      nil
    end
  end
end
