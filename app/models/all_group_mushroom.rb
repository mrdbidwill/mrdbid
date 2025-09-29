class AllGroupMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :all_group

  validates :all_group_id, uniqueness: { scope: :mushroom_id, message: "is already attached to this mushroom" }

  # Validation removed to allow fixtures and controller tests to operate without user coupling
  validate :ensure_same_user

  private

  def ensure_same_user
    return if mushroom.nil? || all_group.nil? # Skip validation if associations are missing
    if mushroom.user_id != all_group.user_id
      errors.add(:all_group, "must belong to the same user as the mushroom")
    end
  end
end


