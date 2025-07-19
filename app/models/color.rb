class Color < ApplicationRecord
  validates :latin_name, :common_name, :hex, :sequence, presence: true
  validates :hex, format: { with: /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, message: 'must be a valid hex code' }
  validates :r_val, :g_val, :b_val, cwc_r, cwc_g, cwc_b,  numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 255 }
  validates :sequence, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scope to order colors by their sequence in the AMS chart
  scope :by_sequence, -> { order(sequence: :asc) }

  # Scope to find colors by group
  scope :by_group, ->(group) { where(color_group: group) }

  # Utility to return the web-safe color as a hex string
  def closest_websafe_hex
    "##{cwc_r.to_s(16).rjust(2, '0')}#{cwc_g.to_s(16).rjust(2, '0')}#{cwc_b.to_s(16).rjust(2, '0')}"
  end
end