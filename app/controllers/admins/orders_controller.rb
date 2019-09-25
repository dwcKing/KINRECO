class Admins::OrdersController < ApplicationController

	def index
		# binding.pry
		@orders = Order.where(end_user_id: current_end_user.id)
		# binding.pry
	end
	def  show
		# binding.pry
	    # binding.pry
	    @order= Order.find(params[:id])
	    # binding.pry
	end
	
	end


