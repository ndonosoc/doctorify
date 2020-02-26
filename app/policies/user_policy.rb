class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(category: true)
    end
  end

  def show?
    true
  end

end
