class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def edit
    @orders = Order.all
  end
end
