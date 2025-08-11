class AllGroup < ApplicationRecord
  belongs_to :user
  has_many :all_group_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :all_group_mushrooms

  # Allow deletion by default. Adjust logic if business rules require restrictions.
  def can_be_deleted?
    true
  end
end

