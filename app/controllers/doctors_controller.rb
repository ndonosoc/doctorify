class DoctorsController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @doctors = policy_scope(User).order(created_at: :desc)
    if params[:specialization].present?
      sql_query = "specialization ILIKE :specialization"
      @doctors = policy_scope(User).where(sql_query, specialization: "%#{params[:specialization]}%")
    else
      @doctors = policy_scope(User)
    end
    # if params[:location].present?
      # @doctors.near(params[:location])
    # end


    # @doctors = policy_scope(User) # .where.not(longitude: nil)
    @markers = @doctors.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude
      }
    end
  end
  def show
    @doctor = User.find(params[:id])
    @appointment = Appointment.new
    authorize @appointment
    authorize @doctor
  end
end

