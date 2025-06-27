module LookupTables
  class Abundance < ApplicationRecord
    belongs_to :source  # Abundance requires a source
    validates :name, :source, presence: true
    validates :name, uniqueness: true
  end
end
