class Api::V1::BoardgamesController < ApplicationController

  def index
    @boardgames = Boardgame.all.order(:id)
  end

  def create

  end

  def update
    
  end

  def destroy
    
  end

end
