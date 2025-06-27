module LookupTables
  class SourceDataType < ApplicationRecord
    # A source data type corresponds to many sources
    has_many :sources, dependent: :restrict_with_exception

    validates :name, presence: true, uniqueness: true
  end
end
