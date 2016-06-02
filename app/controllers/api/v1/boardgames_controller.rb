class Api::V1::BoardgamesController < ApplicationController

  before_action :restrict_access

  def index
    @boardgames = Boardgame.all.order(:id)
  end

  def create

  end

  def update
    
  end

  def destroy
    boardgame = Boardgame.find_by(id: params[:id])
    boardgame.delete
  end

end
