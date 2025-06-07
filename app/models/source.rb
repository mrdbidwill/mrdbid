class Source < ApplicationRecord
  belongs_to :entered_by, class_name: 'User'

end
