class ClusterMushroomPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
