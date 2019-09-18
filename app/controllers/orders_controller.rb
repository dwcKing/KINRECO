class OrdersController < ApplicationController
  def new
    destination = Destination.find(params[:destination][:address])
    order = Order.new(post_code: destination.post_code,last_name: destination.last_name,first_name: destination.first_name,last_kana: destination.last_kana,first_kana: destination.first_kana,address: destination.address,phone_number: destination.phone_number)
    redirect_to users_items_path

  end
end
