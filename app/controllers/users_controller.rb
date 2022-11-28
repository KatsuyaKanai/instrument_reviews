class UsersController < ApplicationController
  def index
    @reviews = Review.all
    reviews = @reviews
    @myreviews = current_user.reviews.all.order(updated_at: :desc)
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id:params[:id])
                     .order(updated_at: :desc)
  end

  def update
  end

  def destroy
  end
end
