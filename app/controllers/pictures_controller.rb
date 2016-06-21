class PicturesController < ApplicationController
  before_action :authenticate_logged_on!, only: [:index, :update]

  def index
    @user = current_user
  end

  def create
    picture = Picture.new(user_id: params[:user_id], link: params[:link])
    authenticate_user(picture.user_id)
    if picture.save
      flash[:success] = "Picture added"
    else
      flash[:danger] = picture.errors.full_messages
    end
    redirect_to "/pictures"
  end

  def update
    picture = Picture.find_by(id: params[:picture_id])
    authenticate_user(picture.user_id)
    if current_user.update(profile_picture: params[:picture_id])
      flash[:success] = "Profile picture set"
    end
    redirect_to "/pictures"
  end

  def destroy
    picture = Picture.find_by(id: params[:id])
    authenticate_user(picture.user_id)
    if !picture.nil?
      picture.delete
      if picture.id == current_user.profile_picture
        current_user.update(profile_picture: nil)
        flash[:success] = "Profile picture deleted, please select a new profile picture"
      else
        flash[:success] = "Picture deleted"
      end
    else
      flash[:danger] = "Picture not found"
    end
    redirect_to "/pictures"
  end

end