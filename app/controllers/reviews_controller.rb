class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render action: :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.permit(:user_id, :name, :address, :latitude, :longitude, :instrument_name, :store_price, :store_reviews, :score)
    end
end
