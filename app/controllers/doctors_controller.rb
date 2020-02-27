class DoctorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

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

end

