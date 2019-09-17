class CartContentsController < ApplicationController
  before_action :setup_cart_item!,only:[:add_item, :update_item, :delete_item]

  def show
    #arrival = Arrival.new(arrivals_quantity: 3)
    #arrival.save
    @item = Item.new
    @cart_items = current_end_user.cart_contents

    @quantities = Arrival.where(item_id: params[:item_id]).select("arrivals_quantity")

    total_quantity = 0
    @quantities.each do |quantity|
      total_quantity += quantity.arrivals_quantity
    end
    @current_stock_array = []

    total_quantity.times do |num|
      if num < 10
        @current_stock_array.push(num + 1)
      else
        break
      end
    end

  end

  def add_item
    if @cart_item
      @cart_item.quantity += params[:item][:quantity].to_i
    else
      @cart_item = current_end_user.cart_contents.build(item_id: params[:item][:item_id],quantity: params[:item][:quantity].to_i)
    end
    @cart_item.save
    redirect_to cart_content_path(current_end_user.id)
  end

  def update_item
    if params[:update]
      @cart_item.update(quantity: params[:item][:arrivals][:quantity].to_i)
      redirect_to cart_content_path(current_end_user.id)
    elsif params[:register]
      redirect_to destinations_path(current_end_user)
    else
      @cart_item.destroy
      redirect_to cart_content_path(current_end_user.id)
    end
  end

  private
  def setup_cart_item!
    @cart_item = current_end_user.cart_contents.find_by(item_id: params[:item][:item_id])
  end
end
