class Mushroom < ApplicationRecord
  belongs_to :state
  belongs_to :country
  belongs_to :fungus_type
  belongs_to :mushroom_storage_location
end
