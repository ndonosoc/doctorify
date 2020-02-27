class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(category: true).where.not(latitude: nil)
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
