class MushroomProjectPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      # Return only records owned via associated project
      scope.joins(:project).where(projects: { user_id: user.id })
    end
  end

  # Reusable ownership logic via associations (project or mushroom)
  def owner?
    (record.respond_to?(:project) && record.project&.user_id == user.id) ||
      (record.respond_to?(:mushroom) && record.mushroom&.user_id == user.id)
  end


  def new?
    user.present?
  end


  def create?
    # When authorizing a class for create (record is a Class), allow signed-in users.
    # Instance-level ownership is enforced elsewhere when acting on a specific record.
    user.present?
  end


  def index?
    true # Everyone can access the index
  end

  def show?
    owner? # Reuse ownership logic
  end

  def edit?
    owner? # Reuse ownership logic
  end

  def update?
    edit? # Reuse `edit?` for update permissions
  end

  def destroy?
    owner?
  end
end