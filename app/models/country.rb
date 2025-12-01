# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :states, foreign_key: :country_id
  has_many :mushrooms, dependent: :nullify

  # Before destroying, provide helpful information about associated records
  before_destroy :check_for_associated_records

  private

  def check_for_associated_records
    mushroom_count = mushrooms.count
    state_count = states.count

    if mushroom_count > 0 || state_count > 0
      warning_parts = []
      warning_parts << "#{mushroom_count} mushroom(s)" if mushroom_count > 0
      warning_parts << "#{state_count} state(s)" if state_count > 0

      Rails.logger.warn("Deleting country '#{name}' with associated records: #{warning_parts.join(', ')}. These records will have their country_id set to NULL.")
    end
  end
end
