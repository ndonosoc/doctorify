class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(category: true).where.not(latitude: nil)
    end
  end

  def show?
    true
  end

end
