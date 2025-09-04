class StorageLocation < ApplicationRecord
  belongs_to :user
  has_many :mushrooms

  validates :name, presence: true
end

