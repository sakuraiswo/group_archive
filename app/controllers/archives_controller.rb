class ArchivesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :check_membership

  def create
    @archive = @room.archives.new(archive_params)

    if params[:image]
      decoded_image = Base64.decode64(params[:image].split(",")[1])
      io = StringIO.new(decoded_image)
      io.set_encoding('BINARY')
      @archive.image.attach(io: io, filename: "capture.png", content_type: "image/png")
    end

    if @archive.save
      redirect_to room_path(@room), notice: 'Archive was successfully created.'
    else
      render :new, status: :unprocessable_entity
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
    params.require(:archive).permit(:supplement, :display_order, :image).merge(user_id: current_user.id)
  end

  def check_membership
    unless @room.users.include?(current_user)
      redirect_to new_user_session_path, alert: 'You are not authorized to access this chatroom.'
    end
  end
  
end
