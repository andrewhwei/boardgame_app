class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @owned_games = @user.ownerships.joins(:boardgame).order('name')
    @full_name = "#{@user.first_name} #{@user.last_name}"
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], location: params[:location], bio: params[:bio])
    flash[:success] = "User info updated"
    redirect_to "/users/#{@user.id}"
    else
      flash[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if !user.nil?
      user.destroy
      pictures = Picture.where("user_id = ?", user.id)
      pictures.each do |picture|
        picture.delete
      end
      games = Ownership.where("user_id = ?", user.id)
      games.each do |game|
        game.delete
      end
      flash[:success] = "Account deleted"
      redirect_to "/users"
    else
      flash[:danger] = "User not found"
      redirect_to "/users"
    end
  end

end