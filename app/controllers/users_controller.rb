class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @ownerships = Ownership.where("user_id = ?", @user.id)
    @full_name = "#{@user.first_name} #{@user.last_name}"
  end

  def edit
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to "/"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to "/"
    end
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], location: params[:location], bio: params[:bio])
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to "/"
    end
    @user.destroy
    redirect_to "/users"
  end

end
