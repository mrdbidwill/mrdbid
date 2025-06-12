class DnaSequence < ApplicationRecord
  belongs_to :mushroom_id
  belongs_to :entered_by, class_name: 'User'

end
