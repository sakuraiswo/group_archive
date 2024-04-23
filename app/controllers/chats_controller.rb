class ChatsController < ApplicationController

  before_action :set_room

  def index
    @chat = Chat.new
    @chats = @room.chats.includes(:user)
    @room_users = @room.room_users.includes(:user).order('created_at ASC')
  end

  def create
    @chat = @room.chats.new(chat_params)
    if @chat.save
      redirect_to room_chats_path(@room), notice: 'Chat message was successfully posted.'
    else
      redirect_to room_chats_path(@room)
    end
  end

  def upload_image
    @chat = @room.chats.new(chat_params)
    if @chat.save
      redirect_to room_chats_path(@room), notice: 'Chat message was successfully posted.'
    else
      redirect_to room_chats_path(@room)
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    chat = Chat.find(params[:id])
    chat.destroy
    redirect_to room_chats_path(@room)
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def chat_params
    params.require(:chat).permit(:message, :image).merge(user_id: current_user.id)
  end

end
