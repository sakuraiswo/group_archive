class QuestionSheetsController < ApplicationController

  before_action :set_room

  def index
    @answer = Answer.new
    @room = Room.find(params[:room_id])
    @question_sheets = QuestionSheet.all
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


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  # Only allow a list of trusted parameters through.
  def question_sheet_params
    params.require(:question_sheet).permit(:question, options_attributes: [:id, :title, :_destroy]).merge(user_id: current_user.id)
  end


end
