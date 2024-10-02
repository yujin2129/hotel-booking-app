class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロフィールを変更しました。"
      redirect_to users_profile_path
    else
      render "edit"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :img, :img_cache)
  end
end
