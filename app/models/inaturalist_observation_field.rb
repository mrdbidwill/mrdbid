class InaturalistObservationField < ApplicationRecord
  # Validations
  validates :inaturalist_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :uuid, uniqueness: true, allow_nil: true

  # Search scope
  scope :search, ->(query) {
    return all if query.blank?

    search_term = "%#{query}%"
    where("name LIKE ?", search_term)
  }

  scope :canonical, -> { where(name: "DNA Barcode ITS", datatype: "dna") }

  scope :canonical_first, -> {
    order(
      Arel.sql("CASE WHEN name = 'DNA Barcode ITS' AND datatype = 'dna' THEN 0 ELSE 1 END"),
      created_at: :desc
    )
  }

  # Order by most recently created in iNaturalist
  scope :recent, -> { order(created_at: :desc) }
  scope :by_name, -> { order(name: :asc) }
end
