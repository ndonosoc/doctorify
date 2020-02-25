class DoctorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @doctors = policy_scope(User).order(created_at: :desc)
  end

end
