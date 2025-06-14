class AllGroup < ApplicationRecord
  has_many :all_group_mushrooms, dependent: :restrict_with_error
  has_many :mushrooms, through: :all_group_mushrooms

  belongs_to :entered_by, class_name: "User"
  belongs_to :source

  before_destroy :ensure_no_mushrooms

  private

  def ensure_no_mushrooms
    if mushrooms.exists?
      errors.add(:base, "Cannot delete an all_group with associated mushrooms")
      throw(:abort)
    end
  end
end
