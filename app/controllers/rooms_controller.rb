class RoomsController < ApplicationController

  def index
    @rooms = Room.order('created_at DESC')
  end

  def new
    @room = RoomTags.new
  end

  def create
    @room = RoomTags.new(room_params)
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
    params.permit(:image, :name, :comic, :agenda, :tag).merge(user_id: current_user.id)
  end
end
