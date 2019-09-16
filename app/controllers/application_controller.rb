class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
=======

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana,:first_kana,:phone_number,:post_code,:address])
  end

  def after_sign_in_path_for(resource)
    case resource
      when Admin
      admins_path
      when EndUser
      users_items_path
  end
>>>>>>> Stashed changes
end
end