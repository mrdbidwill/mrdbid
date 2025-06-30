class LookupTable < ApplicationRecord
  self.abstract_class = true

  # Shared validations
  validates :name, presence: true, uniqueness: true
  validates :source, presence: true

  # Shared methods
  def display_name
    "#{name} - #{description}"
  end

  # Shared lookup utility to fetch associated records by ID
  def self.fetch_by_id(id)
    find_by(id: id) || "N/A" # Returns 'N/A' if the record isn't found
  end

  # Example for safely accessing `name` across lookup instances
  def safe_name
    name || "N/A"
  end
end
