class DoctorsController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @doctors = policy_scope(User).order(created_at: :desc)
    if params[:specialization].present?
      sql_query = "specialization ILIKE :specialization"
      @doctors = User.where(sql_query, specialization: "%#{params[:specialization]}%")
    else
      @doctors = User.all
    end
    # if params[:location].present?
      # @doctors.near(params[:location])
    # end
  end


  #   @doctors = policy_scope(User) # .where.not(longitude: nil)
  #   @markers = @doctors.map do |doctor|
  #     {
  #       lat: doctor.latitude,
  #       lng: doctor.longitude
  #     }
  #   end
  # end
  def show
    @doctor = User.find(params[:id])
    @appointment = Appointment.new
    authorize @appointment
    authorize @doctor
  end
end

