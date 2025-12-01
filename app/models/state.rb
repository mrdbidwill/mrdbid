# app/models/state.rb
class State < ApplicationRecord
  belongs_to :country, class_name: "Country", foreign_key: :country_id
  has_many :mushrooms, dependent: :nullify

  before_create :set_default_country
  before_destroy :check_for_mushrooms

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

  def check_for_mushrooms
    mushroom_count = mushrooms.count
    if mushroom_count > 0
      Rails.logger.warn("Deleting state '#{name}' with #{mushroom_count} associated mushroom(s). These records will have their state_id set to NULL.")
    end
  end

end

