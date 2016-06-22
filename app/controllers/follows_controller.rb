class FollowsController < ApplicationController
  before_action :authenticate_logged_on!

  def index
    @followees = current_user.followees
  end

  def create
    follow = Follow.new(follower_id: current_user.id, followee_id: params[:user_id])
    if follow.save
      flash[:success] = "You are now following #{User.find_by(id: params[:user_id]).first_name}"
    else
      flash[:danger] = follow.errors.messages.values.each do |message|
        message.each do |msg|
          msg
        end
      end
    end
    redirect_to "/users/#{params[:user_id]}"
  end

  def destroy
    follow = Follow.find_by(follower_id: current_user.id, followee_id: params[:user_id])
    if !follow.nil?
      follow.delete
      flash[:success] = "You have unfollowed #{User.find_by(id: params[:user_id]).first_name}"
    else
      flash[:danger] = "You are not following this user"
    end
    redirect_to "/users/#{params[:user_id]}"
  end
end
