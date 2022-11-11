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
    @q = Store.ransack(params[:q])
    @search_reviews = Review.ransack(params[:search_reviews])
    @stores = @q.result
    @reviews = @search_reviews.result
    @recent_reviews = Review.all
                            .order(created_at: :desc)
                            .limit(5)
    
  end

  def show
  end

end
