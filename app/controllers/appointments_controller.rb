class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor

  def index
    @appointments = policy_scope(Appointment).order(created_at: :desc)
  end

  def new
    if @doctor.category != true
      redirect_to root_path
    end
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment
    @appointment.patient = current_user
    @appointment.doctor = @doctor
    if @appointment.save
      redirect_to root_path
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:appointment_date)
  end

  def set_doctor
    @doctor = User.find(params[:user_id])
    authorize @doctor
  end
end
