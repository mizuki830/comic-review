class RoomsController < ApplicationController

  def index
    @rooms = Room.order('created_at DESC')
  end

  def new
    redirect_to user_session_path unless user_signed_in?
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.valid?
      @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def room_params
    params.require(:room).permit(:image, :name, :comic, :agenda).merge(user_id: current_user.id)
  end
end
