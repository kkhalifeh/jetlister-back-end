class PinsController < ApplicationController
  def index
    @pins = Pin.where(user_id: current_user.id)
    render json:@pins
  end

  def create
    @pin = Pin.find_or_create_by(user_id:current_user.id, list_id:params[:list_id])
    render json:@pin
  end

  def delete 
    @pin = Pin.find(params[:id])
    @pin.destroy
    msg = { :status => "ok", :message => "Success!" }
    render json:msg
  end
  
end
