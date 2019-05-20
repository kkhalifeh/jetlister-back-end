class PinsController < ApplicationController
  def index
    @pins = Pin.where(user_id: current_user.id)
    render json:@pins
  end

  def create
    @pin = Pin.create(user_id:current_user.id, list_id:params[:list_id])
    render json:@pin
  end
  
end
