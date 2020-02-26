class DoctorsController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @doctors = policy_scope(User).order(created_at: :desc)
  end

  def show
    @doctor = User.find(params[:id])
    @appointment = Appointment.new
    authorize @appointment
    authorize @doctor
  end

end

