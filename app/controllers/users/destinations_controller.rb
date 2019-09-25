class Users::DestinationsController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(user_params)
    @destination.end_user_id = current_end_user.id
    if @destination.save
      redirect_to users_destinations_path
    else
      render new_users_destination_path
    end
  end

  def index
    @destinations = Destination.where(end_user_id: current_end_user.id)
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    destination = Destination.find(params[:id])
    destination.update(user_params)
    redirect_to users_destinations_path
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    redirect_to users_destinations_path
  end

  private
  def user_params
    params.require(:destination).permit(:last_name,:first_name,:last_kana,:first_kana,:phone_number,:post_code,:address)
  end
end
