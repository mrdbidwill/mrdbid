class Source < ApplicationRecord
  # Correctly associate Source with namespaced LookupTables::SourceDataType
  belongs_to :source_data_type, class_name: "LookupTables::SourceDataType"

  # Validations
  validates :title, presence: true
  validates :source_data_type, presence: true

  # Associations with lookup tables
  has_many :abundances, class_name: "LookupTables::Abundance", dependent: :destroy

  # Add safe_name method
  def safe_name
    title || "N/A"
  end
end
