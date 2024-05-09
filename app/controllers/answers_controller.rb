class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_question_sheet, only: [:create]
  before_action :check_membership

  def create
    option_id = params.dig(:answer, :option_id)
    answer_text = params.dig(:answer, :answer_text)

    # オプションIDまたは回答テキストが提供されていない場合、エラーとする
    unless option_id.present? || answer_text.present?
      return redirect_to room_chats_path(@room), alert: 'You must provide either an option or a text response.'
    end

    # ユーザーが選択したオプションを取得
    @option = Option.find(option_id) if option_id.present?

    # 新しい回答のインスタンスを作成し、選択されたオプションと質問票を関連付ける
    @answer = @question_sheet.answers.new(answer_params)
    @answer.option = @option if @option.present?

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

  def check_membership
    unless @room.users.include?(current_user)
      redirect_to new_user_session_path, alert: 'You are not authorized to access this chatroom.'
    end
  end

end
