# app/policies/camera_model_policy.rb
class CameraModelPolicy < ApplicationPolicy
  class Scope < Scope
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