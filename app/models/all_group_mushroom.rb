class AllGroupMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :all_group

  validate :ensure_same_user

  private

  def ensure_same_user
    if mushroom.user_id != all_group.user_id
      errors.add(:all_group, "must belong to the same user as the mushroom")
    end
  end
end

