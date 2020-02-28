class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(category: true).where.not(latitude: nil,longitude: nil, address: nil, specialization: nil, reference_number: nil, first_name: nil, last_name:nil, phone_number: nil)
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end

