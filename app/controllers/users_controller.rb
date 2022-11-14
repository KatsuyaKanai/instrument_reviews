class UsersController < ApplicationController
  def index
    @reviews = Review.all
    reviews = @reviews
    @myreviews = current_user.reviews.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
