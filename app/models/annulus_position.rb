class AnnulusPosition < ApplicationRecord
  belongs_to :source
  belongs_to :entered_by, class_name: "User"

  validates :name, presence: true, uniqueness: true
  validates :source, presence: true
  validates :entered_by, presence: true
end
