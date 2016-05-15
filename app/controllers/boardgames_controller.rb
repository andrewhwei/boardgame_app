class BoardgamesController < ApplicationController

  def index
    @boardgames = Boardgame.all.order(:name)
    @index_check = 0
  end
  
end
