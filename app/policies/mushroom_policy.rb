class MushroomPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5


  class Scope < ApplicationPolicy::Scope
    # Only show mushrooms that belong to the current user
    def resolve
      scope.where(user: user)
    end
  end

  # Allow index for all signed-in users
  def index?
    true
  end

  # Only show mushrooms owned by the current user
  def show?
    record.user_id == user.id
  end
  def edit?
    record.user_id == user.id
  end

  # Allow create if the user is signed in
  def create?
    user.present?
  end

  # Allow update if the mushroom is owned by the current user
  def update?
    record.user_id == user.id
  end

  # Allow destroy if the mushroom is owned by the current user
  def destroy?
    record.user_id == user.id
  end
end
