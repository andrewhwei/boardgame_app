class BoardgamesController < ApplicationController
    before_action :authenticate_admin!

  def index
    @boardgames = Boardgame.all.order(:name)
  end

  def new
    
  end
  
  def search
    search_term = params[:search]
    @boardgames = Boardgame.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

end
