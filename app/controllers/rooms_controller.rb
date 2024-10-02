class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create]

  def index
    @rooms = @user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "施設を登録しました。"
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
    @reservation = Reservation.new
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "施設情報を編集しました。"
      redirect_to rooms_path
    else
      render "edit"
    end
  end

  def destroy
    @room.destroy
    flash[:notice] = "登録施設を削除しました。"
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def room_params
    params.require(:room).permit(:name, :introduction, :cost, :address, :img, :img_cache, :user_id)
  end

end
