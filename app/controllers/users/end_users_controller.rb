class Users::EndUsersController < ApplicationController
  def index
    @cart_items = Item.where(enduser_id: current_user.id) #現在のエンドユーザのidを持っている商品の一覧
  end

  def destroy
    enduser = EndUser.find(params[:id])
    enduser.destroy
    redirect_to "/"
  end

  def update
    enduser = EndUser.find(params[:id])
    enduser.update(enduser_params)
    redirect_to admins_path(enduser.id)
  end

  def destinations
    @order = Order.new
    @destination = Destination.all
  end

  private
  def enduser_params
    params.require(:end_user).permit(:last_name,:first_name,:last_kana,:first_kana,:phone_number,:email,:post_code,:address,:password)
  end
end
