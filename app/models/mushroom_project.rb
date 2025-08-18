class MushroomProject < ApplicationRecord
  belongs_to :mushroom
  belongs_to :project

  validate :ensure_same_user

  private

  def ensure_same_user
    return if mushroom.nil? || project.nil? # Skip validation if associations are missing
    if mushroom.user_id != project.user_id
      errors.add(:project, "must belong to the same user as the mushroom")
    end
  end
end