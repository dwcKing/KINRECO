class Users::ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def show
    @item = Item.find(params[:id])
  end
end
