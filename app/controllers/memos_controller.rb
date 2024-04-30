class MemosController < ApplicationController

  before_action :set_room


  def create
    @memo = @room.memos.new(memo_params)
    if @memo.save
      redirect_to room_chats_path(@room)
    else
      redirect_to room_chats_path(@room)
    end
  end

  def update
    @memo = @room.memos.find(params[:id])
    if @memo.update(memo_params)
      redirect_to room_chats_path(@room)
    else
      redirect_to room_chats_path(@room)
    end
  end


  def set_room
    @room = Room.find(params[:room_id])
  end

  def memo_params
    params.require(:memo).permit(:my_memo, :my_icon, :user1_memo, :user2_memo, :image).merge(user_id: current_user.id)
  end

end
