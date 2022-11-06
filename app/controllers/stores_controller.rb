class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
  end

  def show
    @store = Store.find(params[:id])
    @review = Review.new
  end

  def edit
  end

  def destroy
  end
end
