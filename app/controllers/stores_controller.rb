class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  before_action :set_q, only: [:index, :search]

  def index
    @reviews = Review.all
    @stores = Store.all
    @results = @q.result
    @stores = @results.distinct
  #   if params[:score]
  #     @stores = Store.avg_score
  #   elsif params[:review_id]
  #     @stores = Store.many_reviews
  #   elsif params[:reviews_score]
  #     @stores = Store.reviews_score
  #   else
  #     @stores = Store.all
  #   end
  # @stores = Store.all.search(search_params)
  

  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(stores_params)
    if @store.save
      
      redirect_to store_path(@store)
    else
      render new_store_path
    end
  end

  def show
    @store = Store.find(params[:id])
    @review = Review.new
  end

  def edit
  end

  def destroy
  end

   def search
    
   end


  private
  def set_q
    @q = Store.ransack(params[:q])
  end


  def stores_params
    params.permit(:user_id, :store_id, :name, :address, :instrument_name, :nearest_station)
  end

  def search_params
    params.permit(:search_word)
  end

  

  
end
