class CartContentsController < ApplicationController
  before_action :setup_cart_item!,only:[:add_item, :update_item, :delete_item]
  before_action :authenticate_end_user!

  def show
    @item = Item.new
    @cart_items = current_end_user.cart_contents
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
    params[:item][:item_id].split(" ").each do |item_id|
      a = "cart_item_id" + item_id
      cart_item = CartContent.find(item_id)
      cart_item.update(quantity:params[a.to_sym].to_i)
    end
      redirect_to destinations_path(current_end_user)
  end

  def destroy
    cart_item = CartContent.find(params[:id])
    cart_item.destroy
    redirect_to cart_content_path(current_end_user.id)
  end

private
  def setup_cart_item!
    @cart_item = current_end_user.cart_contents.find_by(item_id: params[:item][:item_id])
  end

  #def update_params
    #params.require(:item).permit(:arri)
end
