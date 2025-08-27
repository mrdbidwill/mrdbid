class PlantPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def index?; true; end
  def show?; true; end

  def new?;     user&.admin?; end
  def create?;  user&.admin?; end
  def edit?;    user&.admin?; end
  def update?;  user&.admin?; end
  def destroy?; user&.admin?; end
end
