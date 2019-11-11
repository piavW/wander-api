class V1::TrailsController < ApplicationController

  def index
    binding.pry
    GeoCodeAdress.get_geocode(params[:search])
    binding.pry
    @trails = TrailApi.get_trails(latitude, longitude)
  end

  private

  def trail_params
    params.require(:trail).permit(:search)
  end
end