class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: @locations
  end

  def locations_filter
    @locations = Location.all.select {|location| location.lists.length > 0 }
    render json: @locations 
  end 
end
