class Admins::ArrivalsController < ApplicationController

	def new
		@item = Item.find(1)
		@arrivals = @item.arrivals.build
	end

	def create

		arrival = Arrival.new(arrival_params)
	    arrival.save
	    redirect_to admins_item_arrivals_path(arrival.item_id)
	end

	def show
        @arrival = Arrival.find(params[:id])
        @arrival = Item.find(params[:id])

    end

	def edit
		@item = Item.find(params[:item_id])
		@arrival = Arrival.find(params[:id])
	end

    def update
        arrival = Arrival.find(params[:id])
        arrival.update(item_params)
        redirect_to admins_items_path(arrival.id)
    end

	def index
		@arrivals = Arrival.all
		

	end


	def destroy
		@arrival = Arrival.find(params[:id])
		@arrival.destroy
		redirect_to admins_arrivals_path
	end

	private


	def arrival_params
	    params.require(:arrival).permit(:arrivals_date, :arrivals_quantity, :item_id)
	end
	def item_params
        params.require(:item).permit(:title, :artist, :price, :disc_type,:comment)
    end
end
