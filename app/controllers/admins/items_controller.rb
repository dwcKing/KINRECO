class Admins::ItemsController < ApplicationController
 def new
        @item = Item.new
        @genres = Genre.all
    end


    def create
         item = Item.new(item_params)
         item.save
         redirect_to admins_items_path(item.id)
    end

    def index
    	@items = Item.page(params[:page]).per(2)
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end

<<<<<<< HEAD
    def update
=======
     def update
>>>>>>> master
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to admins_items_path(item.id)
    end

    def destroy
    	@item = Item.find(params[:id])
        @item.destroy
        redirect_to admins_items_path
    end



 private
    def item_params
        params.require(:item).permit(:title, :artist, :price, :disc_type,:comment)
    end
end
