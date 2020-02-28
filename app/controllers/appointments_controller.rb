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

    if current_user.last_name == "" || current_user.last_name == nil
      return redirect_to edit_user_registration_path, alert: "You must set your last name and DNI to make an appointment!"
    elsif current_user.dni == "" || current_user.dni == nil
      return redirect_to edit_user_registration_path, alert: "You must set your last name and DNI to make an appointment!"
    end

    @doctor.bookings.each do |appointment|
      if appointment.appointment_date == @appointment.appointment_date
        return redirect_to user_path(@doctor), alert: "The doctor already has an appointment at that time!"
      end
    end

    if @appointment.doctor == current_user
      redirect_to user_path(@doctor), alert: "You can't book an appointment with yourself!"
    elsif @appointment.save
      redirect_to edit_user_registration_path
    else
      redirect_to user_path(@doctor), alert: "You can't book an appointment in the past!"
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
