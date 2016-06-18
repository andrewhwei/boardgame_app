class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    picture = Picture.new(user_id: params[:user_id], link: params[:link])
    picture.save
    redirect_to "/pictures"
  end

  def destroy
    picture = Picture.find_by(id: params[:id])
    picture.delete
    redirect_to "/pictures"
  end

end