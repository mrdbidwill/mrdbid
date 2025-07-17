# app/models/state.rb
class State < ApplicationRecord
  belongs_to :country, class_name: "LookupTables::Country", optional: true

  def self.fetch_by_id(id)
    find_by(id: id) || "N/A" # Returns 'N/A' if the record isn't found
  end

  # Safely access the `name` field
  def safe_name
    name.presence || "N/A"
  end
end
