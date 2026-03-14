# frozen_string_literal: true

module Users
  class PdfExportsController < ApplicationController
    before_action :authenticate_user!
    skip_after_action :verify_authorized, raise: false
    skip_after_action :verify_policy_scoped, raise: false

    def new
      @mushroom_count = Mushroom.where(user_id: current_user.id).count

      if @mushroom_count.zero?
        redirect_to mushrooms_path, alert: "You don't have any mushrooms to export."
        return
      end
    end

    def create
      mushroom_count = Mushroom.where(user_id: current_user.id).count

      if mushroom_count.zero?
        redirect_to mushrooms_path, alert: "You don't have any mushrooms to export."
        return
      end

      existing_export = check_existing_export
      if existing_export
        redirect_to users_pdf_export_status_path(id: existing_export[:export_id]),
                    notice: "A PDF export is already in progress. Please wait for it to complete."
        return
      end

      export_id = SecureRandom.uuid
      store_active_export(export_id)
      Rails.cache.write(
        "pdf_export:#{export_id}",
        {
          status: 'processing',
          user_id: current_user.id,
          created_at: Time.current
        },
        expires_in: 7.days
      )

      UserPdfExportJob.perform_later(current_user.id, export_id)

      Rails.logger.info "[PdfExportsController] Export requested by user #{current_user.id}, export_id: #{export_id}"

      redirect_to users_pdf_export_status_path(id: export_id),
                  notice: "Your PDF export has been queued. This may take several minutes depending on the number of mushrooms."
    end

    def status
      export_id = params[:id]
      @export_info = Rails.cache.read("pdf_export:#{export_id}")

      unless @export_info
        redirect_to mushrooms_path, alert: "Export not found or has expired."
        return
      end

      if @export_info[:user_id] && @export_info[:user_id] != current_user.id
        redirect_to mushrooms_path, alert: "Unauthorized access to export."
        return
      end

      @export_id = export_id
    end

    def download
      export_id = params[:id]
      export_info = Rails.cache.read("pdf_export:#{export_id}")

      unless export_info
        redirect_to mushrooms_path, alert: "Export not found or has expired."
        return
      end

      if export_info[:user_id] && export_info[:user_id] != current_user.id
        redirect_to mushrooms_path, alert: "Unauthorized access to export."
        return
      end

      unless export_info[:status] == 'ready'
        redirect_to users_pdf_export_status_path(id: export_id),
                    alert: "Export is not ready for download yet."
        return
      end

      filename = export_info[:filename]
      file_path = Rails.root.join('..', '..', 'shared', 'public', 'tmp', 'exports', filename)

      unless File.exist?(file_path)
        redirect_to users_pdf_export_status_path(id: export_id),
                    alert: "Export file not found. It may have been cleaned up."
        return
      end

      Rails.logger.info "[PdfExportsController] User #{current_user.id} downloading export: #{filename}"

      response.headers['Content-Type'] = 'application/pdf'
      response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
      response.headers['X-Accel-Redirect'] = "/tmp/exports/#{filename}"
      response.headers['X-Accel-Buffering'] = 'no'

      render body: nil
    end

    private

    def check_existing_export
      active = fetch_active_export
      return nil unless active
      return nil if active[:created_at].blank? || active[:created_at] <= 10.minutes.ago

      { export_id: active[:export_id], export_data: active }
    end

    def fetch_active_export
      Rails.cache.read(active_export_cache_key)
    end

    def store_active_export(export_id)
      Rails.cache.write(
        active_export_cache_key,
        { export_id: export_id, created_at: Time.current },
        expires_in: 30.minutes
      )
    end

    def active_export_cache_key
      "pdf_export:active:#{current_user.id}"
    end
  end
end
