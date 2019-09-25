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
	def edit
		@order= Order.find(params[:id])
	end

	def update
		
		@order= Order.find(params[:id])
		# if params[:order]
	 #        @order.update(order_params)
	 #    elsif params[:item]
	 #    	@order.update(item_params)
	 #    end
	 #    redirect_to admins_order_path(@order.id)
	end

	def destroy
		@order= Order.find(params[:id])

        @order.destroy
        redirect_to admins_orders_path
	end


private
    def order_params
        params.require(:order).permit(:last_name, :first_name, :last_kana, :first_kana,:phone_number,:post_code, :label_id, :comment,:address)
    end

    def item_params
        params.require(:item).permit(:title, :artist, :price,:quantity)
    end
end
