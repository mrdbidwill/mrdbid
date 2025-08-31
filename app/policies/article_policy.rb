class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Admins see all; non-admins see none in /admin
      user&.admin? ? scope.all : scope.none
    end
  end

  def index?
    user&.admin?
  end

  def show?
    user&.admin?
  end

  def create?
    user&.admin?
  end

  def new?
    create?
  end

  def update?
    user&.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin?
  end
end