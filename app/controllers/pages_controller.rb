class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
    @users = User.all.select { |doctor| doctor.category == true }
  end

  def test

  end
end
