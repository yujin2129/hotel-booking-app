class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:edit, :edit_confirm, :update, :destroy]
  before_action :set_reservation_new, only: [:confirm, :create]
  before_action :set_room, except: [:index, :new]
  

  def index
    @user = current_user
    @reservations = @user.reservations
  end

  def new
  end

  def confirm
    render "rooms/show" if @reservation.invalid?
  end

  def create
    @reservation.save
    flash[:notice] = "#{@room.name}の予約が完了しました。"
    redirect_to reservations_path
  end

  def show
  end

  def edit
  end

  def edit_confirm
    @reservation.attributes = reservation_params
    render "edit" if @reservation.invalid?
  end

  def update
    @reservation.update(reservation_params)
    flash[:notice] = "#{@room.name}の再予約が完了しました。"
    redirect_to reservations_path
  end

  def destroy
    @reservation.destroy
    flash[:notice] = "#{@room.name}の予約を削除しました。"
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_reservation_new
    @reservation = Reservation.new(reservation_params)
  end

  def set_room
    @room = @reservation.room
  end

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date, :number_of_people, :user_id, :room_id)
  end
end
