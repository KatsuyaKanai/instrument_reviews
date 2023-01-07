class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  before_action :set_q, only: [:index, :search]

  def index
    @reviews = Review.all
    @stores = Store.all
    @results = @q.result
    @stores = @results.distinct
  end

  def show
    @store = Store.find(params[:id])
    @review = Review.new
  end

  private

  def set_q
    @q = Store.ransack(params[:q])
  end
end
