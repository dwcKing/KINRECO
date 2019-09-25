class Admins::ItemsController < ApplicationController
 def new
        @item = Item.new
        @images = @item.items_images.build
        @arrivals = @item.arrivals.build
        @genres = Genre.all
        @labels = Label.all


    end

    def create
         item = Item.new(item_params)

         if item.save
           redirect_to admins_items_path(item.id)
         else
            byebug
          end
    end

    def index
        @items = Item.page(params[:page]).per(10)
    end

    def show
        @item = Item.find(params[:id])
        @genre = @item.genre
        @label = @item.label
        @like = Like.new
    end

    def edit
        @item = Item.find(params[:id])
    end


     def update
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to admins_item_path(item.id)
    end

    def destroy
        @item = Item.find(params[:id])


        @item.destroy
        redirect_to admins_items_path
    end

    def review
      @review = Review.new
    end


 private
    def item_params
        params.require(:item).permit(:title, :artist, :price, :disc_type, :genre_id,:label_id, :selling_status, :comment,:genres,items_images_images: [],
        arrivals_attributes: [:arrivals_quantity, :arrivals_date],
        discs_attributes: [:id, :disc, :_destroy,
        songs_attributes: [:id, :song_title,:song_order, :_destroy]])
    end
end
