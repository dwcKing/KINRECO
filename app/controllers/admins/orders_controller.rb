class Admins::OrdersController < ApplicationController
  def edit
  @orders = Order.all
end
end
