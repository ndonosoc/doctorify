class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(category: true)
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
