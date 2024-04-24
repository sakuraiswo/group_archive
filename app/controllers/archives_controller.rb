class ArchivesController < ApplicationController

  before_action :set_room


  def create
    @archive = @room.archives.new(archive_params)
    if @chat.save
      render json: { chat: @chat }
    else
      redirect_to room_chats_path(@room)
    end
  end

  def destroy
    archive = Archive.find(params[:id])
    archive.destroy
    redirect_to room_chats_path(@room)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def archive_params
    params.require(:archive).permit(:supplement, :display_order, :image).merge(user_id: current_user.id)
  end


end
