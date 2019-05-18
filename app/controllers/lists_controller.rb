class ListsController < ApplicationController

  def create 
    @list = List.create(author_id: params[:currentuser], location_id: params[:location_id], pinned: 0)
    @places = params[:places].each do |place| Place.create_with(name: place[:name], img_url: place[:photo_ref]).find_or_create_by(google_id: place[:place_id]) end 
    @places.each {|place| ListPlace.create(list_id:@list.id, place_id: (Place.find_by(google_id: place[:place_id])).id )}
    @places.each {|place| PlaceCategory.create(note: place[:note], category_id:place[:category_id], place_id: (Place.find_by(google_id: place[:place_id])).id )}
    render json: @list
  end
end
