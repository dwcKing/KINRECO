class OrdersController < ApplicationController

  def new
    @review = Review.new
  end

  def confirmation
    if params[:order][:end_user_id] == "exist" #既に登録してあるお届け先を選択した場合
      @destination = Destination.find(params[:order][:delivery_charge])
      @payment = params[:order][:payment]
    elsif params[:order][:end_user_id] == "new" #新しくお届け先を入力した場合
      @destination = Destination.new
      @destination.post_code = params[:order][:post_code]
      @destination.last_name = params[:order][:last_name]
      @destination.first_name = params[:order][:first_name]
      @destination.last_kana = params[:order][:last_kana]
      @destination.first_kana = params[:order][:first_kana]
      @destination.address = params[:order][:address]
      @destination.phone_number = params[:order][:phone_number]
      @destination.end_user_id = current_end_user.id
      @payment = params[:order][:payment]
      if @destination.save == false
        @address = Destination.all
        @order = Order.new(post_code: params[:order][:post_code], last_name: params[:order][:last_name], first_name: params[:order][:first_name], last_kana: params[:order][:last_kana], first_kana: params[:order][:first_kana], address: params[:order][:address], phone_number: params[:order][:phone_number], delivery_charge: params[:order][:delivery_charge], payment: params[:order][:payment], end_user_id: current_end_user.id)
        render template: "users/end_users/destinations"
      end
    end
    # @destination = destination
    @cart_contents = CartContent.where(end_user_id: current_end_user.id)
  end

  def complete
    order = Order.new #購入確認画面の情報をOrderテーブルに保存
    order.post_code = params[:post_code]
    order.last_name = params[:last_name]
    order.first_name = params[:first_name]
    order.last_kana = params[:last_kana]
    order.first_kana = params[:first_kana]
    order.address = params[:address]
    order.phone_number = params[:phone_number]
    order.payment = params[:payment]
    order.delivery_charge = 500
    order.order_status = 0
    order.end_user_id = current_end_user.id
    order.save

    mycart_items = CartContent.where(end_user_id: current_end_user)
    items_order = 0
    mycart_items.each do |mycart_item| #購入した商品の数量、価格、商品情報、注文情報をItemsOrderテーブルに保存
      items_order = ItemsOrder.new
      items_order.quantity = mycart_item.quantity
      items_order.tax_add_price = (mycart_item.item.price * 1.08).floor #税率8%を掛けて、小数点を切り捨て
      items_order.price = mycart_item.item.price
      items_order.item_id = mycart_item.item_id
      items_order.order_id = order.id
      items_order.save

    end

    mycart_items.destroy_all #カート内商品の削除
  end

end
