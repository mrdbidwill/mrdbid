# app/models/lookup_type.rb
class LookupType < ApplicationRecord
  has_many :mr_characters
  has_many :lookup_items
  validates :name, presence: true, uniqueness: true
end
