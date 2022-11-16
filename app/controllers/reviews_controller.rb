class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  #before_action :set_q_reviews, only: [:index, :search]
  def index
    @store = Store.find(params[:store_id])
    @reviews = @store.reviews.order(updated_at: :desc)
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
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(edit_review_params)
    redirect_to store_reviews_path(@review.store_id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = '口コミが削除されました。'
    redirect_to store_reviews_path(@review.store_id)
  end

  def search
    @q = Review.ransack(params[:q])
    @reviews = @q.result.order(updated_at: :desc)
    # @reviews = Review.all.search(search_reviews_params).order(updated_at: :desc)
    # @store = Store.all
    # render "reviews/search"
  end

  
  private
    def review_params
      params.require(:review).permit(:store_id, :reviews_title, :instrument_name, :store_price, :store_reviews, :score)
    end

    def edit_review_params
      params.require(:review).permit(:store_id, :reviews_title, :instrument_name, :store_price, :store_reviews, :score)
    end
    def search_reviews_params
      params.permit(:search_instrument_name)
    end

    #なぜransackで検索できているか不明点
    # def set_q_reviews
    #   @search_reviews = Review.ransack(params[:search_reviews])
    # end
end
