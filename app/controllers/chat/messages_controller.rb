class Chat::MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create!(chat_message_params)
  end

  private
  def set_room
    @room = Chat::Room.find(params[:room_id])
  end

  def chat_message_params
    params.require(:chat_message).permit(:body)
  end
end
