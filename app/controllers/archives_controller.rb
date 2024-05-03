class ArchivesController < ApplicationController
  before_action :set_room

  def create
    @archive = @room.archives.new(archive_params)

    if params[:image].present?
      # Blobデータが直接送信されるため、Active Storageにアタッチする
      @archive.image.attach(params[:image])
    end

    if @archive.save
      # 成功した場合はリダイレクト
      redirect_to room_chats_path(@room) and return
    else
      # 保存が失敗した場合はエラーメッセージを含めてJSONを返す
      render json: { status: 'error', errors: @archive.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    archive = Archive.find(params[:id])
    archive.destroy
    redirect_to room_chats_path(@room)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def archive_params
    # Blobデータを受け取るために`:image`を許可
    params.require(:archive).permit(:supplement, :display_order, :image).merge(user_id: current_user.id)
  end
end
