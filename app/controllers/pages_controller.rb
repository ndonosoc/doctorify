class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
    @users = User.where(category: true)
  end
end
