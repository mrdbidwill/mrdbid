# app/models/state.rb
class State < ApplicationRecord
  belongs_to :country, class_name: "Country", foreign_key: :country_id

  before_create :set_default_country

  def self.fetch_by_id(id)
    find_by(id: id) || "N/A" # Returns 'N/A' if the record isn't found
  end

  # Safely access the `name` field
  def safe_name
    name.presence || "N/A"
  end

  private

  def set_default_country
    # If the state's country is not set, and the associated `mr_character_id` is 101, set default country_id to 835
    if country_id.nil? && country&.mr_character_id == 101
      self.country_id = 1   # USA
    end
  end

end

