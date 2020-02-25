class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = policy_scope(Appointment).order(created_at: :desc)
  end

  def new
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment
    @appointment.patient = current_user
    if @appointment.save
      redirect_to root_path
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:appointment_date, :doctor_id)
  end
end
