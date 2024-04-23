class ChatsController < ApplicationController

  before_action :set_room

  def create
    @chat = @room.chats.new(chat_params)
    if @chat.save
      redirect_to room_path(@room), notice: 'Chat message was successfully posted.'
    else
      redirect_to room_path(@room), alert: 'Failed to post chat message.'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id)
  end

end
