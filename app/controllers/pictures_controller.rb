class PicturesController < ApplicationController
  before_action :authenticate_logged_on!, only: [:index]

  def index
    @user = current_user
  end

  def create
    picture = Picture.new(user_id: params[:user_id], link: params[:link])
    authenticate_user(picture.user_id)
    if picture.save
      flash[:success] = "Picture added"
      redirect_to "/pictures"
    else
      flash[:danger] = picture.errors.full_messages
      redirect_to "/pictures"
    end
  end

  def destroy
    picture = Picture.find_by(id: params[:id])
    authenticate_user(picture.user_id)
    if !picture.nil?
      picture.delete
      flash[:success] = "Picture deleted"
      redirect_to "/pictures"
    else
      flash[:danger] = "Picture not found"
      redirect_to "/pictures"
    end
  end

end