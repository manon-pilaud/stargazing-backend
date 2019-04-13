class LocationsController < ApplicationController
  def index
  render json: Location.all
end

def show
  render json: {
    location: Location.find(params[:id])
  }
end

def create
  render json: Location.create(location_params)
end

def update
    Location.find(params[:id]).update(location_params)
    render json: Location.find(params[:id])
  end

  def destroy
    render json: Location.find(params[:id]).destroy
  end

private
def location_params
  params.require(:location).permit(:name,:description,:latitude,:longitude,:category,:rating,:image,:area,:country,:creator)
end
end
