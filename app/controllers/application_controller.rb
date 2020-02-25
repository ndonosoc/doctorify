class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:category])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number,
                                                              :dni, :reference_number, :location,
                                                              :specialization])
  end
end
