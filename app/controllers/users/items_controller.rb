class Users::ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
    @label = @item.label

    total_quantity_i = 0
    @item.arrivals.each do |item_arrival|
      total_quantity_i  += item_arrival.arrivals_quantity #商品の入荷数総数
    end
    total_item_quantity_i = 0
    @item.items_orders.each_with_index do |item_quantity,i| #販売済み商品の総数
      total_item_quantity_i += item_quantity.quantity
    end
    @total_stock = total_quantity_i - total_item_quantity_i  #在庫数量 = 入荷総数 - 販売済み商品の総数
  end

  def top
  	@new_item_image = Item.order('id').limit(10)
    @items = Item.select(:title)
  end

private
  def item_params
    params.require(:item).permit(:title, :artist, :price, :disc_type, :genre_id, :label_id, :comment,:genres,items_images_images: [],
    discs_attributes: [:id, :disc, :_destroy,
    songs_attributes: [:id, :song_title,:song_order, :_destroy]])
  end
end
