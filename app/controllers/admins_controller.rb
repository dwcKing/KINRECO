class AdminsController < ApplicationController
	def top
	end

	def index
	  @endusers = EndUser.page(params[:page]).per(20)
  end

  def show
	  @enduser = EndUser.find(params[:id])
  end

	def edit
	  @enduser = EndUser.find(params[:id])
  end

	def edit_password
		@enduser = EndUser.find(params[:id])
	end
end
