class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "登録が完了しました。"
      redirect_to store_reviews_path(@review.store)
    else
      flash[:notice] = "登録に失敗しました。"
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
    render "reviews/search"
  end

  
  private
    def review_params
      params.require(:review).permit(:store_reviews, :score)
    end

    def search_reviews_params
      params.permit(:search_reviews_keyword, :search_reviews_instrument_name)
    end
end
