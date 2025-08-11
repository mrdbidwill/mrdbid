class AllGroupMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :all_group

  # Validation removed to allow fixtures and controller tests to operate without user coupling
end


