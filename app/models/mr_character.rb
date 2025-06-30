class MrCharacter < ApplicationRecord
  belongs_to :display_option, class_name: "LookupTables::DisplayOption", foreign_key: "display_option"
  belongs_to :part, class_name: "LookupTables::Part", foreign_key: "part"
  belongs_to :source, class_name: "Source", foreign_key: "source"

  # Example: Fetch associated display option name
  def display_option_name
    display_option&.safe_name
  end

  # Example: Fetch associated part name
  def part_name
    part&.safe_name
  end

  # Example: Fetch associated source name
  def source_name
    source&.safe_name
  end
end
