class MrCharacter < ApplicationRecord
  belongs_to :display_option, class_name: "LookupTables::DisplayOption", foreign_key: "display_option_id"
  belongs_to :part, class_name: "LookupTables::Part", foreign_key: "part_id"
  belongs_to :source, class_name: "Source", foreign_key: "source_id"

  # Helper methods for associations
  def display_option_name
    display_option&.safe_name
  end

  def part_name
    part&.safe_name
  end

  def source_details
    return unless source
    {
      title: source.title,
      author: source.author,
      ref: source.ref,
      item_code: source.item_code.presence || "N/A",
      comment: source.comment.presence || "N/A"
    }
  end
end
