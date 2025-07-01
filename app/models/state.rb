class State < ApplicationRecord
  belongs_to :source
  belongs_to :country

  def self.fetch_by_id(id)
    find_by(id: id) || "N/A" # Returns 'N/A' if the record isn't found
  end

  # Safely access the `name` field
  def safe_name
    name.presence || "N/A"
  end
end
