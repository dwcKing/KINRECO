class Admins::AdminsController < ApplicationController
	before_action :authenticate_admin!

	def top #トップページ
		  	@genre=Genre.new
		  	@label=Label.new
		    @likes=Item.find(Like.group(:item_id).order("count(item_id) desc").limit(5).pluck(:item_id))
	end

	def index #ユーザ一覧
	  @endusers = EndUser.with_deleted.page(params[:page]).per(10)
  end

  def show #ユーザ詳細
	  @enduser = EndUser.with_deleted.find(params[:id])
  end

	def edit #ユーザ編集
	  @enduser = EndUser.find(params[:id])
  end

	def update #ユーザ編集（処理）
	  enduser = EndUser.find(params[:id])
  	enduser.update(update_params)
	  redirect_to admins_admin_path(enduser.id)
	end

	def edit_password #ユーザ編集 パスワード変更
		@password = EndUser.find(params[:id])
	end

	def password_update #ユーザ編集 パスワード変更(処理)
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
