class Admins::AdminsController < ApplicationController
	def top
		  	@genre=Genre.new
		  	@label=Label.new
		    @likes=Item.find(Like.group(:item_id).order("count(item_id) desc").limit(5).pluck(:item_id))
	end

	def index
	  @endusers = EndUser.page(params[:page]).per(1)
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
