class QuestionSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :check_membership

  def index
    @answer = Answer.new
  end

  def create
    @question_sheet = @room.question_sheets.new(question_sheet_params)

    if @question_sheet.save
      redirect_to room_chats_path(@room), notice: 'Question sheet was successfully created.'
    else
      flash[:alert] = @question_sheet.errors.full_messages.to_sentence
      redirect_to room_chats_path(@room)
    end
  end

  def destroy
    question_sheet = QuestionSheet.find(params[:id])
    question_sheet.destroy
    redirect_to room_chats_path(@room)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  # Only allow a list of trusted parameters through.
  def question_sheet_params
    params.require(:question_sheet).permit(:question,
                                           options_attributes: %i[id title _destroy]).merge(user_id: current_user.id)
  end

  def check_membership
    unless @room.users.include?(current_user)
      redirect_to new_user_session_path, alert: 'You are not authorized to access this chatroom.'
    end
  end

end
