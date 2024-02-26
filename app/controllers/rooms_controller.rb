class RoomsController < ApplicationController
before_action :authenticate_user!

  def search
    @search = "ホテル一覧です"
    @rooms = Room.search(params[:area],params[:keyword])
  end

  def index
    @rooms = current_user.rooms #ログイン中のユーザのIDと、roomの外部キー(user_id)が一致するroom全て
  end

  def new
    @room = Room.new
    @user = current_user.id
  end

  def create
    @room = Room.new(params.require(:room).permit(:name,:detail,:charge,:address,:hotel_image,:user_id))
    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @user = current_user.id
  end

end


