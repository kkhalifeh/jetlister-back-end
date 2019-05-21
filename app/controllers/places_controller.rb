class PlacesController < ApplicationController
  def create
    @place = Place.create_with(name: params[:name], img_url: params[:photo_ref]).find_or_create_by(google_id: params[:google_id])
    render json:@place
  end
end
