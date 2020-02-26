class DoctorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # @doctors = policy_scope(User).order(created_at: :desc)

    @doctors = policy_scope(User).where.not(longitude: nil)

    @markers = @doctors.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude
      }
    end
  end
end

