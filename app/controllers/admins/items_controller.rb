class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!

    def new #登録
        @item = Item.new
        @images = @item.items_images.build
        @arrivals = @item.arrivals.build
        @genres = Genre.all
        @labels = Label.all
    end

    def create #登録処理
         @item = Item.new(item_params)
         if @item.save
           redirect_to admins_items_path(@item.id)
         else
            render "admins/items/new"
         end
    end

    def index #一覧
    end

    def show #詳細
        @item = Item.find(params[:id])
        @genre = @item.genre
        @label = @item.label
        @like = Like.new
    end

    def edit #編集
        @item = Item.find(params[:id])
    end

     def update #編集(処理)
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to admins_item_path(item.id)
    end

    def destroy #削除
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to admins_items_path
    end

 private
    def item_params
        params.require(:item).permit(:title, :artist, :price, :disc_type, :genre_id,:label_id, :selling_status, :comment,:genres,items_images_images: [],

        arrivals_attributes: [:arrivals_quantity, :arrivals_date],
        discs_attributes: [:id, :disc, :_destroy,
        songs_attributes: [:id, :song_title,:song_order, :_destroy]])
    end
end
