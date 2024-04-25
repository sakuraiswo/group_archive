class AnswersController < ApplicationController
  before_action :set_room
  before_action :set_question_sheet, only: [:create]

  def create
    # ユーザーが選択したオプションを取得
    @option = Option.find(params[:answer][:option_id])

    # 新しい回答のインスタンスを作成し、選択されたオプションと質問票を関連付ける
    @answer = @question_sheet.answers.new(answer_params)
    @answer.option = @option

    if @answer.save
      redirect_to room_chats_path(@room), notice: 'Your answer was successfully submitted.'
    else
      redirect_to room_chats_path(@room), alert: @answer.errors.full_messages.to_sentence
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_question_sheet
    @question_sheet = QuestionSheet.find(params[:question_sheet_id])
  end

  def answer_params
    params.require(:answer).permit(:answer_text, :option_id, :question_sheet_id).merge(user_id: current_user.id)
  end
end
