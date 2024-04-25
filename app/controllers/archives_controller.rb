class ArchivesController < ApplicationController
  before_action :set_room

  def create
    @archive = @room.archives.new(archive_params)

    if params[:image].present?
      # Base64エンコードされた画像データをデコードし、Active Storageにアタッチする
      data = params[:image].sub(%r{^data:image/\w+;base64,}, '')
      decoded_data = Base64.decode64(data)
      image_io = StringIO.new(decoded_data)
      image_file = { io: image_io, filename: 'archive_image.png', content_type: 'image/png' }
      @archive.image.attach(image_file)
    end

    if @archive.save
      redirect_to room_chats_path(@room)
      render json: { status: 'success', archive: @archive }, status: :created
    else
      render json: { status: 'error', errors: @archive.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def archive_params
    params.require(:archive).permit(:supplement, :display_order, :image).merge(user_id: current_user.id)
  end
end
