class ChatsController < ApplicationController
  before_action :set_room

  def index
    @question_sheet = QuestionSheet.new
    5.times { @question_sheet.options.build }
    @archive = Archive.new
    @chat = Chat.new
    @question_sheets = @room.question_sheets.includes(:user, :options).order(created_at: :desc)
    @archives = @room.archives.includes(:user)
    @chats = @room.chats.includes(:user)
    @room_users = @room.room_users.includes(:user).order('created_at ASC')
  end

  def create
    @chat = @room.chats.new(chat_params)
    if @chat.save
      redirect_to room_chats_path(@room)
      # render json: { chat: @chat }
    else
      redirect_to room_chats_path(@room)
    end
  end

  def destroy
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
