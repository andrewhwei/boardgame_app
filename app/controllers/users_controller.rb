class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    all_users = User.where("admin != ?", true).shuffle
    @random_users = []
    8.times do |n|
      @random_users.push(all_users[n])
    end
    @pictures = Picture.all

    if current_user && !current_user.followees.empty?
      followed_users = current_user.followees.last(10).reverse
      @news_feed = {}
      followed_users.each do |news|
        if news.ownerships.last.num_of_plays == 1
          @news_feed[news.id] = "#{news.first_name} just played #{news.ownerships.last.boardgame.name} for the first time!"
        elsif news.ownerships.last.rating <= 5
          @news_feed[news.id] = "#{news.first_name} didn't like #{news.ownerships.last.boardgame.name} and gave it a #{news.ownerships.last.rating}!"
        elsif news.ownerships.last.rating == 10
          @news_feed[news.id] = "#{news.first_name} loved #{news.ownerships.last.boardgame.name} and gave it a #{news.ownerships.last.rating}!"
        else
          @news_feed[news.id] = "#{news.first_name} recently played #{news.ownerships.last.boardgame.name} and gave it a #{news.ownerships.last.rating} out of 10."
        end
      end
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @owned_games = @user.ownerships.joins(:boardgame).order('name')
    @full_name = "#{@user.first_name} #{@user.last_name}"
    @profile_picture = Picture.where("id = ?", @user.profile_picture)
    @user_pictures = @user.pictures.where("id != ?", @user.profile_picture)
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
    else
      flash[:danger] = "User not found"
    end
    redirect_to "/users"
  end

end