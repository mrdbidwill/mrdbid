# frozen_string_literal: true

require 'zip'
require 'csv'

# Background job to export all of a user's images as a ZIP file
class UserImageExportJob < ApplicationJob
  queue_as :default

  def perform(user_id, export_id)
    user = User.find(user_id)
    Rails.logger.info "[UserImageExportJob] Starting export for user #{user_id}, export_id: #{export_id}"

    # Create temp directory for this export
    temp_dir = Rails.root.join('tmp', 'image_exports', export_id)
    FileUtils.mkdir_p(temp_dir)

    zip_filename = "mrdbid_images_#{user.id}_#{Time.current.strftime('%Y%m%d_%H%M%S')}.zip"
    zip_path = temp_dir.join(zip_filename)

    begin
      # Find all image_mushrooms for this user
      image_mushrooms = ImageMushroom.joins(:mushroom)
                                     .where(mushrooms: { user_id: user.id })
                                     .includes(:mushroom, :part, :camera_make, :camera_model, :lens)
                                     .order('mushrooms.genus_id, mushrooms.species_id, image_mushrooms.created_at')

      if image_mushrooms.empty?
        Rails.logger.info "[UserImageExportJob] No images found for user #{user_id}"
        mark_export_failed(export_id, "No images found to export")
        return
      end

      Rails.logger.info "[UserImageExportJob] Found #{image_mushrooms.count} images for user #{user_id}"

      # Create ZIP file
      Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
        # Add manifest CSV with metadata
        manifest_data = generate_manifest(image_mushrooms)
        zipfile.get_output_stream("manifest.csv") { |f| f.write manifest_data }

        # Add README
        readme_content = generate_readme(user, image_mushrooms.count)
        zipfile.get_output_stream("README.txt") { |f| f.write readme_content }

        # Add each image
        image_mushrooms.each_with_index do |img_mush, index|
          next unless img_mush.image_file.attached?

          begin
            # Download the blob to a temp file
            img_mush.image_file.open(tmpdir: Dir.tmpdir) do |file|
              # Create organized filename
              mushroom_name = sanitize_filename(img_mush.mushroom.genus_name || "unknown")
              species_name = sanitize_filename(img_mush.mushroom.species_name || "sp")
              image_name = sanitize_filename(img_mush.image_name || "image")
              extension = File.extname(img_mush.image_file.filename.to_s)

              # Format: MushroomName_species_imagename_001.jpg
              safe_filename = "#{mushroom_name}_#{species_name}_#{image_name}_#{(index + 1).to_s.rjust(3, '0')}#{extension}"

              # Add to ZIP in images/ subdirectory
              zipfile.add("images/#{safe_filename}", file.path)

              Rails.logger.debug "[UserImageExportJob] Added image #{index + 1}/#{image_mushrooms.count}: #{safe_filename}"
            end
          rescue => e
            Rails.logger.error "[UserImageExportJob] Failed to add image #{img_mush.id}: #{e.message}"
            # Continue with other images
          end
        end
      end

      # Move ZIP to shared public directory for download
      export_dir = Rails.root.join('..', '..', 'shared', 'public', 'tmp', 'exports')
      FileUtils.mkdir_p(export_dir)

      final_path = export_dir.join(zip_filename)
      FileUtils.mv(zip_path, final_path)
      FileUtils.chmod(0644, final_path)

      file_size = File.size(final_path)
      file_size_mb = (file_size / 1024.0 / 1024.0).round(2)

      Rails.logger.info "[UserImageExportJob] Export completed: #{final_path} (#{file_size_mb} MB)"

      # Mark export as ready
      mark_export_ready(export_id, zip_filename, file_size)

      # Schedule cleanup after 24 hours
      CleanupExportJob.set(wait: 24.hours).perform_later(final_path.to_s) if defined?(CleanupExportJob)

    rescue => e
      Rails.logger.error "[UserImageExportJob] Export failed for user #{user_id}: #{e.class} - #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      mark_export_failed(export_id, e.message)
    ensure
      # Clean up temp directory
      FileUtils.rm_rf(temp_dir) if temp_dir && Dir.exist?(temp_dir)
    end
  end

  private

  def generate_manifest(image_mushrooms)
    CSV.generate do |csv|
      csv << [
        'Image Filename',
        'Mushroom Genus',
        'Mushroom Species',
        'Part',
        'Date Taken',
        'Camera Make',
        'Camera Model',
        'Lens',
        'Exposure',
        'Aperture',
        'ISO',
        'Width',
        'Height',
        'Latitude',
        'Longitude',
        'Comments',
        'Upload Date'
      ]

      image_mushrooms.each_with_index do |img_mush, index|
        next unless img_mush.image_file.attached?

        mushroom_name = sanitize_filename(img_mush.mushroom.genus_name || "unknown")
        species_name = sanitize_filename(img_mush.mushroom.species_name || "sp")
        image_name = sanitize_filename(img_mush.image_name || "image")
        extension = File.extname(img_mush.image_file.filename.to_s)
        safe_filename = "#{mushroom_name}_#{species_name}_#{image_name}_#{(index + 1).to_s.rjust(3, '0')}#{extension}"

        csv << [
          safe_filename,
          img_mush.mushroom.genus_name,
          img_mush.mushroom.species_name,
          img_mush.part&.name,
          img_mush.date_taken&.strftime('%Y-%m-%d %H:%M:%S'),
          img_mush.camera_make&.name,
          img_mush.camera_model&.name,
          img_mush.lens&.name,
          img_mush.exposure,
          img_mush.aperture,
          img_mush.iso,
          img_mush.image_width,
          img_mush.image_height,
          img_mush.latitude,
          img_mush.longitude,
          img_mush.comments,
          img_mush.created_at&.strftime('%Y-%m-%d %H:%M:%S')
        ]
      end
    end
  end

  def generate_readme(user, image_count)
    <<~README
      MRDBID Image Export
      ===================

      User: #{user.email}
      Export Date: #{Time.current.strftime('%Y-%m-%d %H:%M:%S')}
      Total Images: #{image_count}

      This archive contains all your mushroom images from MRDBID.

      Contents:
      ---------
      - README.txt: This file
      - manifest.csv: Spreadsheet with all image metadata (EXIF, locations, etc.)
      - images/: Folder containing all your images

      Image Naming:
      -------------
      Images are named: GenusName_speciesname_imagename_001.jpg

      The manifest.csv file contains all metadata including:
      - Original mushroom identification
      - EXIF data (camera, lens, exposure settings)
      - GPS coordinates (if available)
      - Upload dates and comments

      For questions or support, visit: https://mrdbid.com/contact

      Generated by MRDBID - Mushroom Research Database
    README
  end

  def sanitize_filename(filename)
    # Remove or replace characters that are unsafe in filenames
    filename.to_s
            .gsub(/[^0-9A-Za-z.\-]/, '_')  # Replace unsafe chars with underscore
            .gsub(/_{2,}/, '_')              # Replace multiple underscores with single
            .gsub(/^_|_$/, '')               # Remove leading/trailing underscores
  end

  def mark_export_ready(export_id, filename, file_size)
    # Store export info in cache for controller to retrieve
    # Using cache instead of database to keep it simple
    Rails.cache.write(
      "image_export:#{export_id}",
      {
        status: 'ready',
        filename: filename,
        file_size: file_size,
        created_at: Time.current
      },
      expires_in: 25.hours  # Slightly longer than file cleanup
    )
  end

  def mark_export_failed(export_id, error_message)
    Rails.cache.write(
      "image_export:#{export_id}",
      {
        status: 'failed',
        error: error_message,
        created_at: Time.current
      },
      expires_in: 24.hours
    )
  end
end
