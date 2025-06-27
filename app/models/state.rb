class State < ApplicationRecord
  belongs_to :source
  belongs_to :country
end
