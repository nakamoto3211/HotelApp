class UsersController < ApplicationController
  def home
    @home = "ホームページです"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(params.require(:user).permit(:name, :icon_image))
      binding.pry
      flash[:notice] = "プロフィール情報を更新しました"
      redirect_to user_path(id: current_user)
    else
      binding.pry
      render "edit"
    end
  end
    
end
