class State < ApplicationRecord
  belongs_to :source
  belongs_to :country
  belongs_to :entered_by
end
