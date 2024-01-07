class Chat::RoomsController < ApplicationController
  def index
    @rooms = Chat::Room.public_rooms
  end

  def show
    @room = Chat::Room.find(params[:id])
  end
end
