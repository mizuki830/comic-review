class ReviewsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @review = current_user.reviews.new(review_params)
    if @review.valid?
      @review.save
      redirect_to room_path(@room)
    else
      render 'rooms/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(room_id: params[:room_id])
  end
end
