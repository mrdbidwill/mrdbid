class AllGroupMushroomPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      # Allow users to see associations for their own mushrooms
      scope.joins(:mushroom).where(mushrooms: { user_id: user.id })
    end
  end


  def create?
    record.mushroom&.user_id == user.id
  end

  def index?
    true
  end

  def show?
    record.mushroom&.user_id == user.id
  end

  def update?
    record.mushroom&.user_id == user.id
  end

  def destroy?
    record.mushroom&.user_id == user.id
  end
end
