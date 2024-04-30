class ChatsController < ApplicationController
  before_action :set_room

  def index
    if @room.memos.find_by(user_id: current_user.id).present?
      @memo = @room.memos.find_by(user_id: current_user.id)
    else
      @memo = Memo.new
    end
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
      render :index
    end
  end

  def destroy
    chat = Chat.find(params[:id])
    if chat
      chat.destroy
      redirect_to room_chats_path(@room), notice: 'Chat was successfully destroyed.'
    else
      redirect_to room_chats_path(@room), alert: 'Chat not found.'
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
