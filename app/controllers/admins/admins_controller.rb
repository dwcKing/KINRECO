class Admins::AdminsController < ApplicationController
	def top
		  	@genre=Genre.new
		  	@label=Label.new
		    @likes=Item.find(Like.group(:item_id).order("count(item_id) desc").limit(5).pluck(:item_id))
	end

	def index
	  @endusers = EndUser.with_deleted.page(params[:page]).per(10)
  end

  def show
	  @enduser = EndUser.with_deleted.find(params[:id])

  end

	def edit
	  @enduser = EndUser.find(params[:id])
  end

	def update

	  enduser = EndUser.find(params[:id])
  	enduser.update(update_params)
	  redirect_to admins_admin_path(enduser.id)
	end

	def edit_password
		@password = EndUser.find(params[:id])
	end

	def password_update
		byebug
		password = EndUser.find(params[:id])
		password.update(password_params)
		redirect_to admins_admin_path(enduser.id)
	end

	private
	def update_params
		params.require(:end_user).permit(:last_name,:first_name,:last_kana,:first_kana,:phone_number,:email,:post_code,:address)
	end

	def password_params
		params.require(:end_user).permit(:password)
	end
end
