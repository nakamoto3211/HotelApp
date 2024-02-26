class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations #ログイン中のユーザのIDと、reservationの外部キー(user_id)が一致するreservation全て
  end

  def confilm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @number_of_days = (@reservation.check_out - @reservation.check_in).to_i
    @total_charge = @room.charge * @number_of_days * @reservation.number_of_people
    if @reservation.invalid?
      render 'rooms/show'
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "施設の予約が完了しました。"
      redirect_to :reservations
    else
      render :confilm
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :user_id, :room_id)
    end
end
