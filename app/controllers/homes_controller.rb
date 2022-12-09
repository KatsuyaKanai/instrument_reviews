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
    @recent_reviews = Review.includes(:user)
      .order(created_at: :desc)
      .limit(3)
    @high_rate_store = Store
      .includes(:reviews)
      .distinct
      .sort_by do |store|
        hoges = store.reviews
        if hoges.present?
          hoges.map(&:score).sum / hoges.size
        else
          0
        end
      end
      .reverse
      .first(3)
  end
end
