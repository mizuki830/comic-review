class RoomsController < ApplicationController
  before_action :choice_room, only: [:show, :edit, :update, :destroy]

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
    @review = Review.new
    @reviews = @room.reviews
    #@tag = RoomTags.new(tag_params)
    #if @tag.valid?
      #@tag.save
      #redirect_to room_path(@room)
    #else
      #render 'show'
    #end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end

  def destroy
    if @room.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def room_params
    params.require(:room).permit(:image, :name, :comic, :agenda).merge(user_id: current_user.id)
  end

  def choice_room
    @room = Room.find(params[:id])
  end

  def tag_params
    params.permit(:tag)
  end
end
