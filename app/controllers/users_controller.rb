class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @full_name = "#{@user.first_name} #{@user.last_name}"
  end

end
