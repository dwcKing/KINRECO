class Admins::ArrivalsController < ApplicationController
	before_action :authenticate_admin!

	def new #入荷登録
		@item = Item.find(params[:item_id])
		@arrivals = @item.arrivals.build
	end

	def create #入登録処理
		arrival = Arrival.new(arrival_params)
		arrival.item_id = params[:item_id]
	    if arrival.save
	    	redirect_to "/admins/items/#{arrival.item_id}/arrivals"
	    else
	    	render :new
		  end
	end

	def edit #入荷編集
		@item = Item.find(params[:item_id])
		@arrival = Arrival.find(params[:id])
	end

  def update #入荷編集処理
    arrival = Arrival.find(params[:id])
    arrival.update(arrival_params)
    redirect_to arrivals_index_path
  end

	def index #入荷情報一覧
    @arrivals = Arrival.page(params[:page]).per(10)
	end

	def destroy #入荷情報削除
		@arrival = Arrival.find(params[:id])
		@arrival.destroy
		redirect_to admins_item_arrivals_path(params[:item_id])
	end

	def arrivals_index #商品に紐付いた入荷情報一覧
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
