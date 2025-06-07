class Cluster < ApplicationRecord
  belongs_to :entered_by, class_name: 'User'

  belongs_to :source
  belongs_to :entered_by, class_name: 'User'

end
