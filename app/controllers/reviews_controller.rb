class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment

  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.appointment = @appointment
    if @review.save
      redirect_to root_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_appointment
    @user = User.find(params[:user_id])
    authorize @user
    @appointment = Appointment.find(params[:appointment_id])
    authorize @appointment
  end
end
