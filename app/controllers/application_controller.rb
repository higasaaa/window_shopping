class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_login_customer

  def get_login_customer
    @customer = current_customer
  end


  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthdate, :sex, :live_area])
  end
end
