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
      flash[:notice] = "登録が完了しました。"
      redirect_to review_path(@review)
    else
      flash[:notice] = "登録に失敗しました。"
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

  def search
    @reviews = Review.all.search(search_reviews_params)
    render "reviews/search"
  end

  
  private
    def review_params
      params.permit(:user_id, :name, :address, :latitude, :longitude, :instrument_name, :store_price, :store_reviews, :score)
    end

    def search_reviews_params
      params.permit(:search_reviews_keyword, :search_reviews_instrument_name)
    end
end
