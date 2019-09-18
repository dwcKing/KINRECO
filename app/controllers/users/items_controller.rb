class Users::ItemsController < ApplicationController
  def index
  @q = Item.ransack(params[:q])
  @users = @q.result(distinct: true)
  end

  def top
  end
end
