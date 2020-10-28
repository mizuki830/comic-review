class RoomsController < ApplicationController

  def index
    @rooms = Room.order('created_at DESC')
  end

  def new
    @room = RoomTag.new
  end

  def create
    @room = RoomTag.new(room_params)
    if @room.valid?
      @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end

  private

  def room_params
    params.require(:room_tag).permit(:image, :name, :comic, :agenda, :tag).merge(user_id: current_user.id)
  end
end
