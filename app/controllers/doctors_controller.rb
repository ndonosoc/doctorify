class DoctorsController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @doctors = policy_scope(User).order(created_at: :desc)
    if params[:specialization].present?
      sql_query = "specialization ILIKE :specialization"
      @doctors = policy_scope(User).where(sql_query, specialization: params[:specialization])
    else

      @doctors = policy_scope(User)

    end
    if params[:address].present?
      @doctors.near(params[:address])
    end

    # @doctors = policy_scope(User) # .where.not(longitude: nil)
    @markers = @doctors.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude
      }
    end
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
    @markers = [{
        lat: @doctor.latitude,
        lng: @doctor.longitude
      }]
    @appointment = Appointment.new
    authorize @appointment
    authorize @doctor

    if @doctor.reviews.count > 0
      sumofreviews = 0
      @doctor.reviews.each do |review|
        sumofreviews += review.rating
      end
      @averagerating = sumofreviews / @doctor.reviews.count
    end
  end

end

