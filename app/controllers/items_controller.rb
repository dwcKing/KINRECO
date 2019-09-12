class ItemsController < ApplicationController
 def new
        @item = Item.new
    end


    def create
         item = Item.new(item_params)
         item.save
         redirect_to items_path(item.id)
    end

    def index 
    	@items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end

     def update
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to items_path(item.id)
    end

    def destroy
    	@item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path
    end



 private
    def item_params
        params.require(:item).permit(:title, :artist, :price)
    end
end
