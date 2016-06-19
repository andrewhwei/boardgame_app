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

  private
  def authenticate_user(user_id)
    unless current_user && current_user.id.to_s == user_id.to_s
      # flash[:error] = "Please access one of your own pages"
      redirect_to "/"
    end
  end

end