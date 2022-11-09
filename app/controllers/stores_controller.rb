class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  def index
    
  #@stores = Store.all
  if params[:latest]
    @stores = Store.latest
  elsif params[:old]
    @stores = Store.old
  else params[:reviews_score]
    @stores = Store.reviews_score
  # else
  #   @stores = Store.all
  @stores = Store.all.search(search_params)
  end

  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(stores_params)
    if @store.save
      
      redirect_to store_path(@store)
    else
      redirect_to new_store_parh
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
     @stores = Store.all.search(search_params)
     render "stores/search"
   end


  private
  def stores_params
    params.permit(:user_id, :store_id, :name, :address, :instrument_name, :nearest_station)
  end

  def search_params
    params.permit(:search_word)
  end

  
end
