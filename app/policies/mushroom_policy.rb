class MushroomPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < ApplicationPolicy::Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5


  class Scope < ApplicationPolicy::Scope
    # Only show mushrooms that belong to the current user
    def resolve
      scope.where(user: user)
    end
  end

  # Shared logic to check if the current user owns the mushroom
  def owner?
    record.user_id == user.id
  end



  # Allow index for all signed-in users
  def index?
    user.present?
  end

  # Allow any signed-in user to view any mushroom (public viewing)
  def show?
    user.present?
  end
  def edit?
    owner?
  end

  # Allow create if the user is signed in
  def create?
    user.present?
  end

  # Allow update if the mushroom is owned by the current user
  def update?
    owner?
  end

  # Allow destroy if the mushroom is owned by the current user
  def destroy?
    owner?
  end

  def mushroom_image_mushroom?
    owner?
  end

  # Allow adding to a group
  def all_group_mushroom?
    owner?
  end

  # Allow adding to a cluster
  def mushroom_cluster?
    owner?
  end

  # Allow adding to a project
  def mushroom_project?
    owner?
  end

end
