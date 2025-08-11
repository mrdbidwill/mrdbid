class ImageMushroomPolicy < ApplicationPolicy
  def create?
    user.present? && record.mushroom.user_id == user.id
  end

  # Similarly, define other actions like `update?`, `destroy?`
end