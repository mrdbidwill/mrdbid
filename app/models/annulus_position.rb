class AnnulusPosition < ApplicationRecord
  belongs_to :source
  belongs_to :entered_by
end
