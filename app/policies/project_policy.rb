class ProjectPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      # Projects from all users are visible/selectable
      scope.all
    end
  end

  # Reusable ownership logic
  def owner?
    record.user_id == user.id
  end

  def new?
    true
  end

  def create?
    owner? # Reuse ownership logic
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
    owner? && record.can_be_deleted? # Additional condition for delete
  end
end