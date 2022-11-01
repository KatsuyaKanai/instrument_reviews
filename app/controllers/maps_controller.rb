class MapsController < ApplicationController

  def index
    @maps=Map.all
  end

  def new
    @map=Map.new
  end

  def show
    @map=Map.find_by(id:params[:id])
  end

  def create
    @map=Map.new(map_params)
    if @map.save
      redirect_to maps_path
    else
      render action: :new
    end
  end

  def map_params
    params.require(:map).permit(:name, :address, :latitude, :longitude)
  end

end
