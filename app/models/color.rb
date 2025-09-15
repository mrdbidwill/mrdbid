class Color < ApplicationRecord
  validates :latin_name, :common_name, presence: true

  # Scope to order colors by their sequence in the AMS chart
  scope :by_sequence, -> { order(sequence: :asc) }

  # Scope to find colors by group
  scope :by_group, ->(group) { where(color_group: group) }
end
