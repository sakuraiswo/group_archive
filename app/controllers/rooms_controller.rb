class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_membership, only: :update

  def index
    @rooms = current_user.rooms.order(created_at: :desc)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path, notice: 'Room was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @room = Room.find(params[:id])
    return unless @room.update(room_params)

    redirect_to room_chats_path(@room)
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :group_memo, user_ids: [])
  end

  def check_membership
    unless @room.users.include?(current_user)
      redirect_to new_user_session_path, alert: 'You are not authorized to access this chatroom.'
    end
  end

end
