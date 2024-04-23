class ChatsController < ApplicationController

  before_action :set_room

  def index
    @chat = Chat.new
    @room = Room.find(params[:room_id])
    @chats = @room.chats.includes(:user)
    @room_users = @room.room_users.includes(:user).order('created_at ASC')
  end

  def create
    @chat = @room.chats.new(chat_params)
    if @chat.save
      redirect_to room_chats_path(@room), notice: 'Chat message was successfully posted.'
    else
      redirect_to room_chats_path(@room), alert: 'Failed to post chat message.'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def chat_params
    params.require(:chat).permit(:message, :image).merge(user_id: current_user.id)
  end

end
