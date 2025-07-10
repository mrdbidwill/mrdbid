# frozen_string_literal: true

class LookupItem < ApplicationRecord
  self.inheritance_column = :type

  validates :name, presence: true, uniqueness: { scope: :type }

  # Convenience method to get class name without namespace
  def self.lookup_type
    name.demodulize
  end
end
