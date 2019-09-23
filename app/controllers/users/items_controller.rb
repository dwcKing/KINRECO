class Users::ItemsController < ApplicationController

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    @items = Item.page(params[:page]).per(5)
  end

  def show
        @item = Item.find(params[:id])
        @genre = @item.genre
        @label = @item.label
  end

  def top
  	@items = Item.order('id').limit(10)
  end

 private
    def item_params
        params.require(:item).permit(:title, :artist, :price, :disc_type, :genre_id, :label_id, :comment,:genres,items_images_images: [],
        discs_attributes: [:id, :disc, :_destroy,
        songs_attributes: [:id, :song_title,:song_order, :_destroy]])
    end
end
