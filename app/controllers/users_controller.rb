class UsersController < ApplicationController
  def index
    @reviews = Review.includes(:store)
    # reviews = @reviews
    @myreviews = current_user.reviews.all.order(updated_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.includes(:store).
      where(user_id: params[:id]).
      order(updated_at: :desc)
  end
end
