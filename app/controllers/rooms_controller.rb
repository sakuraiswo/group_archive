class RoomsController < ApplicationController
  before_action :authenticate_user!

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
 
 
  private
 
  def room_params
   params.require(:room).permit(:room_name, :group_memo, user_ids: [])
  end



end
