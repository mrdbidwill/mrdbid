class AllGroupPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      # Only groups owned by the current user
      scope.where(user_id: user.id)
    end
  end

  def owner?
    record.user_id == user.id
  end
end