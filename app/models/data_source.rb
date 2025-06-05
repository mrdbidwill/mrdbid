class DataSource < ApplicationRecord
  belongs_to :source
  belongs_to :entered_by
end
