class ImageMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :part, optional: true

  # Attachments and presence validations
  has_one_attached :image_file

  validates :image_file, presence: { message: "An image file must be selected" }

  # Ensure the Mushroom is associated with the correct user if needed
  def user_id
    mushroom.user_id
  end

  # Convenience for views/tests
  def dimensions
    if image_width.present? && image_height.present?
      "#{image_width}x#{image_height}"
    else
      nil
    end
  end

  # Extract EXIF after create and when image_file changes
  after_commit :extract_exif_if_needed, on: [:create, :update]

  private

  def extract_exif_if_needed
    return unless image_file.attached?
    # Only run if this record was just created or the image changed
    if previous_changes.key?("id") || attachment_changed?
      extract_and_store_exif
    end
  end

  def attachment_changed?
    # Detect attachment changes across Rails versions
    if respond_to?(:saved_change_to_image_file_attachment?)
      saved_change_to_image_file_attachment?
    else
      image_file.attachment&.previous_changes&.key?("blob_id")
    end
  end

  def extract_and_store_exif
    # Prefer EXIFR for JPEG/TIFF, fall back to ExifTool for HEIC/RAW/others
    image_file.open(tmpdir: Dir.tmpdir) do |file|
      data = exif_from_exifr(file) || exif_from_exiftool(file)
      return unless data

      # Only fill blanks to preserve any manual overrides
      self.image_width  ||= data[:image_width]
      self.image_height ||= data[:image_height]
      self.camera_make  ||= data[:camera_make]
      self.camera_model ||= data[:camera_model]
      self.lens         ||= data[:lens]
      self.exposure     ||= data[:exposure]
      self.aperture     ||= data[:aperture]
      self.iso          ||= data[:iso]

      save(validate: false)
    end
  rescue => e
    Rails.logger.info("[ImageMushroom##{id}] EXIF extraction skipped: #{e.class} - #{e.message}")
  end

  def exif_from_exifr(file)
    require "exifr/jpeg"
    require "exifr/tiff"
    exif = nil
    begin
      exif = EXIFR::JPEG.new(file)
      exif = nil unless exif&.exif?
    rescue StandardError
      exif = nil
    end

    if exif.nil?
      begin
        exif = EXIFR::TIFF.new(file)
      rescue StandardError
        exif = nil
      end
    end

    return nil unless exif

    {
      image_width:  safe_int(exif.width),
      image_height: safe_int(exif.height),
      camera_make:  exif.make.to_s.presence,
      camera_model: exif.model.to_s.presence,
      lens:         (exif.respond_to?(:lens_model) ? exif.lens_model.to_s.presence : nil),
      exposure:     format_exposure(exif.respond_to?(:exposure_time) ? exif.exposure_time : nil),
      aperture:     format_aperture(exif.respond_to?(:f_number) ? exif.f_number : nil),
      iso:          (exif.respond_to?(:iso_speed_ratings) ? Array(exif.iso_speed_ratings).compact.first.to_s.presence : nil)
    }
  rescue => e
    Rails.logger.debug("[ImageMushroom##{id}] EXIFR parse failed: #{e.class} - #{e.message}")
    nil
  end

  def exif_from_exiftool(file)
    require "mini_exiftool"
    tags = MiniExiftool.new(file.path)

    width  = (tags[:image_width]  || tags[:exif_image_width]  || nil)
    height = (tags[:image_height] || tags[:exif_image_height] || nil)

    exp = tags[:exposure_time] # Often like "1/125"
    # If exposure is numeric (rare), format similarly
    exposure_str =
      if exp.is_a?(String)
        exp.end_with?("s") ? exp : "#{exp}s"
      elsif exp.respond_to?(:to_f)
        format_exposure(exp.to_f)
      else
        nil
      end

    fnum = tags[:fnumber] || tags[:f_number]
    aperture_str = fnum ? format_aperture(fnum) : nil

    {
      image_width:  safe_int(width),
      image_height: safe_int(height),
      camera_make:  tags[:make].to_s.presence,
      camera_model: tags[:model].to_s.presence,
      lens:         (tags[:lens_model] || tags[:lens] || nil).to_s.presence,
      exposure:     exposure_str,
      aperture:     aperture_str,
      iso:          (tags[:iso] || tags[:iso_speed_ratings]).to_s.presence
    }
  rescue => e
    Rails.logger.debug("[ImageMushroom##{id}] ExifTool parse failed: #{e.class} - #{e.message}")
    nil
  end

  def safe_int(value)
    Integer(value) rescue nil
  end

  def format_exposure(exp)
    return nil unless exp
    # EXIFR can give Rational or Numeric
    rational = exp.respond_to?(:numerator) ? exp : nil
    seconds =
      if rational
        num = rational.numerator.to_f
        den = rational.denominator.to_f
        return nil if num.zero? || den.zero?
        num / den
      else
        exp.to_f
      end
    return nil if seconds <= 0
    if seconds < 1.0
      denom = (1.0 / seconds).round
      "1/#{denom}s"
    else
      "#{seconds.round(2)}s"
    end
  end

  def format_aperture(fnum)
    return nil unless fnum
    f = fnum.to_f
    return nil if f <= 0
    "f/#{f.round(1)}"
  end
end
