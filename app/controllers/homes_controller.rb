class HomesController < ApplicationController

 before_action :set_search, :set_reviews

  def set_search
    @q = Store.ransack(params[:q])
    @stores = @q.result
    
  end
  def set_reviews
    @search_reviews = Review.ransack(params[:search_reviews])
    @reviews = @search_reviews.result
  end
  

  def index
    @user = User.all
    @q = Store.ransack(params[:q])
    @search_reviews = Review.ransack(params[:search_reviews])
    @stores = @q.result
    @reviews = @search_reviews.result
    @recent_reviews = Review.all
                            .order(created_at: :desc)
                            .limit(3)
    @highty_rate_review = Store.left_joins(:reviews)
                               .order(score: :desc)
                               .distinct
                               .limit(3)
  end

  def show
  end

end
