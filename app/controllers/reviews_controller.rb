class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  #before_action :set_q_reviews, only: [:index, :search]
  def index
    @store = Store.find(params[:store_id])
    @reviews = @store.reviews.order(updated_at: :desc)
    #review#indexのソート機能
    # selection = params[:keyword]
    # @reviews = @store.reviews.sort(selection)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = 'レビューが投稿されました'
      redirect_to store_reviews_path(@review.store)
    else
      @store = Store.find(params[:store_id])
      flash[:alert] = "レビューの投稿に失敗しました"
      render "stores/show"
    end
  end

  # def show
  #   @review = Review.find(params[:id])
  # end

  def edit
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(edit_review_params)
    flash[:notice] = "レビューを編集しました" 
    redirect_to store_reviews_path(@review.store_id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:alert] = '口コミが削除されました'
    redirect_back fallback_location: store_reviews_path(@review.store_id)
  end

  def search
    @q = Review.ransack(params[:q])
    @reviews = @q.result.order(updated_at: :desc)
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
