class HomesController < ApplicationController
  def index
    @reviews = Review.all
    @recent_reviews = Review.order(created_at: :desc)
                            .limit(5)
  end

  def show
  end
end
