class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @store = Store.find(params[:store_id])
    @reviews = @store.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to store_reviews_path(@review.store)
    else
      @store = Store.find(params[:id])
      render "stores/show"
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

  def search
    @reviews = Review.all.search(search_reviews_params)
    @store = Store.all
    render "reviews/search"
  end

  
  private
    def review_params
      params.require(:review).permit(:store_id, :instrument_name, :store_price, :store_reviews, :score)
    end

    def search_reviews_params
      params.permit(:search_instrument_name)
    end
end
