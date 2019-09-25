class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_update_parameters, if: :devise_controller?, only: [:update]
  before_action :set_search
  before_action :autocomplete

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana,:first_kana,:phone_number,:post_code,:address])
  end

  def configure_update_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_kana, :first_kana, :post_code, :address, :phone_number])
  end



  def after_sign_in_path_for(resource)
    case resource
      when Admin
      admins_path
      when EndUser
      mypage_path(current_end_user)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :end_user
     new_end_user_session_path
    else
     root_path
    end
  end


  def set_search
    @search = Item.ransack(params[:q])
    @search_items = @search.result.page(params[:page]).per(5)
  end

  def autocomplete
    @autocomplete_item = Item.pluck(:title).to_json.html_safe
  end
end
