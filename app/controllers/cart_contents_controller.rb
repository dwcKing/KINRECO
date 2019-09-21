class CartContentsController < ApplicationController
  before_action :setup_cart_item!,only:[:add_item, :update_item, :delete_item]

  def show
    @item = Item.new
    @cart_items = current_end_user.cart_contents
    @current_stock_array = []
    @a = []
    total_quantity = 0
    @cart_items.each do |cart_item|
      #quantity = Arrival.find_by(item_id: cart_item.item_id)
      #a = quantity.arrivals_quantity
    end

    #
    # @cart_items.each do |cart_item|
    #   quantities = Arrival.where(item_id: cart_item.item_id).select("arrivals_quantity")
    #   quantities.each do |quantity|
    #     total_quantity += quantity.arrivals_quantity
    #   end
    #
    #   # total_quantity.times do |num|
      #   if num < 10
      #     @current_stock_array.push(num + 1)
      #     binding.pry
      #   else
      #     break
      #   end
      # end

    # end
  end

  def add_item
    if @cart_item
      #if #在庫が1個以上あるとき
      @cart_item.quantity += params[:item][:quantity].to_i
    else
      @cart_item = current_end_user.cart_contents.build(item_id: params[:item][:item_id],quantity: params[:item][:quantity].to_i)
    end
    @cart_item.save
    redirect_to cart_content_path(current_end_user.id)
  end

  def update_item
    binding.pry
    if params[:update]
      @cart_item.update(quantity:params[:item][:arrivals][:quantity].to_i)
      render cart_content_path(current_end_user.id)
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

  #def update_params
    #params.require(:item).permit(:arri)
end
