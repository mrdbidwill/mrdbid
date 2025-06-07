class Mushroom < ApplicationRecord
  belongs_to :mushroom_location
  belongs_to :state_id
  belongs_to :country_id
  belongs_to :fungus_type
  belongs_to :entered_by, class_name: 'User'

end
