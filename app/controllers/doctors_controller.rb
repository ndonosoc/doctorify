class DoctorsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :skip_authorization, only: [:index, :show]
  def index
    @doctors = policy_scope(User).order(created_at: :desc)
    if params[:specialization].present? && params[:address].present?
      sql_query = "specialization ILIKE :specialization"
      @doctors = policy_scope(User).where(sql_query, specialization: params[:specialization]).near(params[:address])

    elsif params[:specialization].present?
      sql_query = "specialization ILIKE :specialization"
      @doctors = policy_scope(User).where(sql_query, specialization: params[:specialization])

    elsif params[:address].present?
      @doctors.near(params[:address])

    else
      @doctors = policy_scope(User)
    end

    # @doctors = policy_scope(User) # .where.not(longitude: nil)
    unless @doctors.empty?
    @markers = @doctors.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { doctor: doctor })
      }
    end
  end
  end

  def show

    @doctor = User.find(params[:id])
    # authorize current_user
    if @doctor.category == true
      @markers = [{
        lat: @doctor.latitude,
        lng: @doctor.longitude
      }]
      @appointment = Appointment.new
      authorize @appointment
      authorize @doctor


      counter = 0
      sumofreviews = 0

      @doctor.bookings.each do |booking|
        if booking.review != nil
          counter += 1
          sumofreviews += booking.review.rating
        end
        @averagerating = sumofreviews.fdiv(counter)
      end
    else
      redirect_to root_path
    end
  end
end

