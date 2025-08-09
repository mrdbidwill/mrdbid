class AllGroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Allow users to see only their own groups
      scope.where(user_id: user.id)
    end
  end


  def create?
    record.user_id == user.id
  end

  def index?
    true
  end

  def show?
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end
end