class OrdersController < ApplicationController
  def new

    if params[:order][:end_user_id] == "new"
      order = Order.new
      destination = Destination.find(params[:order][:delivery_charge])
      order.post_code = destination.post_code
      order.last_name = destination.last_name
      order.first_name = destination.first_name
      order.last_kana = destination.last_kana
      order.first_kana = destination.first_kana
      order.address = destination.address
      order.phone_number = destination.phone_number
      order.payment = params[:order][:payment]
      order.save
    elsif params[:order][:end_user_id] == "exist"
      order = Order.new
      order.post_code = params[:order][:post_code]
      order.last_name = params[:order][:last_name]
      order.first_name = params[:order][:first_name]
      order.last_kana = params[:order][:last_kana]
      order.first_kana = params[:order][:first_kana]
      order.address = params[:order][:address]
      order.phone_number = params[:order][:phone_number]
      order.payment = params[:order][:payment]
      order.save
    end
      redirect_to  confirmation_path(order.id)
  end

  def confirmation
    @order = Order.find(params[:id])
    @cart_contents = CartContent.where(end_user_id: current_end_user.id)

  end

end
