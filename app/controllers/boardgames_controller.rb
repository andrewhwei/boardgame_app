class BoardgamesController < ApplicationController
    before_action :authenticate_admin!

  def index

  end

  def new
    @boardgame = Boardgame.new(name: params[:name], developer: params[:developer])  
    if @boardgame.save
      
      redirect_to "/boardgames"
    else
      render :new
    end
  end

  def create
    
  end

end
