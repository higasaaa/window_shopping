class Public::RegistrationsController < Devise::RegistrationsController

  def after_sign_in_path_for(resource)
    customers_path
  end
end

