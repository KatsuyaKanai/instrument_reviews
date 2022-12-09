class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  before_action :set_q, only: [:index, :search]

  def index
    @reviews = Review.all
    @stores = Store.all
    @results = @q.result
    @stores = @results.distinct
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
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.update(edit_store_params)
    if @store.valid?
      flash[:notice] = "店情報を編集しました"
      redirect_to stores_path
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    flash[:alert] = '店情報が削除されました'
    redirect_to stores_path
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

  def edit_store_params
    params.require(:store).permit(:user_id, :name, :address, :nearest_station)
  end

  def search_params
    params.permit(:search_word)
  end
end
