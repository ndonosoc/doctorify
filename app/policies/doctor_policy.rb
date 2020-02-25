class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(category: true)
    end
  end


end
