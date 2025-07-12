# app/models/lookup_type.rb
class LookupType < ApplicationRecord
  has_many :lookup_items, dependent: :nullify

  validates :name, presence: true
end