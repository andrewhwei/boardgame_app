class PicturesController < ApplicationController
  before_action :authenticate_logged_on!, only: [:index]

  def index
    @user = current_user
  end

  def create
    picture = Picture.new(user_id: params[:user_id], link: params[:link])
    authenticate_user(picture.user_id)
    picture.save
    redirect_to "/pictures"
  end

  def destroy
    picture = Picture.find_by(id: params[:id])
    authenticate_user(picture.user_id)
    picture.delete
    redirect_to "/pictures"
  end

end