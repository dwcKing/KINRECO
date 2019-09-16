class ApplicationController < ActionController::Base
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
>>>>>>> master

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana,:first_kana,:phone_number,:post_code,:address])
  end

<<<<<<< HEAD
  def after_sign_in_path_for(resource)
    case resource
      when Admin
      admins_path
      when EndUser
      users_items_path
  end
>>>>>>> Stashed changes
=======
  def after_sign_out_path_for(resource_or_scope)
   if resource_or_scope == :end_user
     new_end_user_session_path
   else
     root_path
   end
 end
>>>>>>> master
end
end