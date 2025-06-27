class LookupTable < ApplicationRecord
  self.abstract_class = true

  # Shared validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :source, presence: true

  # Shared methods (if needed)
  def display_name
    "#{name} - #{description}"
  end
end
