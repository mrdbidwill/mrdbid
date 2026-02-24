class InaturalistObservationField < ApplicationRecord
  # Validations
  validates :inaturalist_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :uuid, uniqueness: true, allow_nil: true

  # Search scope
  scope :search, ->(query) {
    return all if query.blank?

    search_term = "%#{query}%"
    where("name LIKE ? OR description LIKE ? OR allowed_values LIKE ?",
          search_term, search_term, search_term)
  }

  # Order by most recently created in iNaturalist
  scope :recent, -> { order(created_at: :desc) }
  scope :by_name, -> { order(name: :asc) }
end
