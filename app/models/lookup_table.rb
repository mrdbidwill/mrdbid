class LookupTable < ApplicationRecord
  self.abstract_class = true  # Marks this as an abstract class; it won't map to any database table

  belongs_to :source

  # Validations
  validates :name, presence: true, uniqueness: {scope: :source} # Scoped uniqueness
  validates :source, presence: true
end
