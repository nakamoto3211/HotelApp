class UsersController < ApplicationController
  def home
    @home = "ホームページです"
  end

  def show
    @user = User.find(params[:id])
  end
end
