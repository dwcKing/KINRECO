class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana,:first_kana,:phone_number,:post_code,:address])
  end

  def after_sign_up_path_for(resource_or_scope)
    mypage_path(current_end_user)
  end

  def after_sign_in_path_for(resource_or_scope)
    mypage_path(current_end_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :end_user
     new_end_user_session_path
    else
     root_path
    end
  end
end
