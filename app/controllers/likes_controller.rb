class LikesController < ApplicationController
  before_action :authenticate_end_user!
  
  def create
    @like = current_end_user.likes.create(item_id: params[:item_id])
    redirect_back(fallback_location: items_path)
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], end_user_id: current_end_user.id)
    @like.destroy
    redirect_back(fallback_location: items_path)
  end
end
