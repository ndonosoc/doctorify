class DoctorsController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @doctors = policy_scope(User)
    @markers = @doctors.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude
      }
    end
  end
  def show
    @doctor = User.find(params[:id])
    @markers = [{
        lat: @doctor.latitude,
        lng: @doctor.longitude
      }]
    @appointment = Appointment.new
    authorize @appointment
    authorize @doctor
  end
end

