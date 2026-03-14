# frozen_string_literal: true

# Background job to export all of a user's mushrooms as a PDF file
class UserPdfExportJob < ApplicationJob
  queue_as :default

  def perform(user_id, export_id)
    user = User.find(user_id)
    Rails.logger.info "[UserPdfExportJob] Starting export for user #{user_id}, export_id: #{export_id}"

    temp_dir = Rails.root.join('tmp', 'pdf_exports', export_id)
    FileUtils.mkdir_p(temp_dir)

    pdf_filename = "mrdbid_mushrooms_#{user.id}_#{Time.current.strftime('%Y%m%d_%H%M%S')}.pdf"
    pdf_path = temp_dir.join(pdf_filename)

    begin
      mushrooms = Mushroom.includes(
        :country, :state, :fungus_type, :genera, :species, :trees, :plants,
        image_mushrooms: { image_file_attachment: :blob },
        mr_character_mushrooms: { mr_character: [:part, :display_option] }
      ).where(user_id: user.id).order(:name)

      if mushrooms.empty?
        Rails.logger.info "[UserPdfExportJob] No mushrooms found for user #{user_id}"
        mark_export_failed(export_id, "No mushrooms found to export")
        return
      end

      pdf = MushroomPdfService.new(mushrooms).generate
      pdf.render_file(pdf_path.to_s)

      export_dir = Rails.root.join('..', '..', 'shared', 'public', 'tmp', 'exports')
      FileUtils.mkdir_p(export_dir)

      final_path = export_dir.join(pdf_filename)
      FileUtils.mv(pdf_path, final_path)
      FileUtils.chmod(0644, final_path)

      file_size = File.size(final_path)
      file_size_mb = (file_size / 1024.0 / 1024.0).round(2)

      Rails.logger.info "[UserPdfExportJob] Export completed: #{final_path} (#{file_size_mb} MB)"

      mark_export_ready(export_id, pdf_filename, file_size)
      CleanupExportJob.set(wait: 7.days).perform_later(final_path.to_s) if defined?(CleanupExportJob)
    rescue => e
      Rails.logger.error "[UserPdfExportJob] Export failed for user #{user_id}: #{e.class} - #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      mark_export_failed(export_id, e.message)
    ensure
      FileUtils.rm_rf(temp_dir) if temp_dir && Dir.exist?(temp_dir)
    end
  end

  private

  def mark_export_ready(export_id, filename, file_size)
    Rails.cache.write(
      "pdf_export:#{export_id}",
      {
        status: 'ready',
        filename: filename,
        file_size: file_size,
        created_at: Time.current
      },
      expires_in: 7.days
    )
  end

  def mark_export_failed(export_id, error_message)
    Rails.cache.write(
      "pdf_export:#{export_id}",
      {
        status: 'failed',
        error: error_message,
        created_at: Time.current
      },
      expires_in: 7.days
    )
  end
end
