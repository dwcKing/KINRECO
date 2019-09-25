class Admins::ArrivalsController < ApplicationController

	def new
		@item = Item.find(params[:item_id])
		@arrivals = @item.arrivals.build
	end

	def create
		arrival = Arrival.new(arrival_params)
		arrival.item_id = params[:item_id]
	    if arrival.save
	    	redirect_to "/admins/items/#{arrival.item_id}/arrivals"
	    else
	    	render :new
		end
	end

	def show
        @arrival = Arrival.find(params[:id])
        @arrival = Item.find(params[:item_id])

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
    	@arrivals = Arrival.page(params[:page]).per(10)
	end


	def destroy
		@arrival = Arrival.find(params[:id])
		@arrival.destroy
		redirect_to admins_item_arrivals_path(params[:item_id])
	end

	def arrivals_index
    	@arrivals = Arrival.page(params[:page]).per(10)
	end

	private


	def arrival_params
	    params.require(:arrival).permit(:arrivals_date, :arrivals_quantity, :item_id)
	end
	def item_params
        params.require(:item).permit(:title, :artist, :price, :disc_type,:comment)
    end

end
