class BoardgamesController < ApplicationController

  def index
    @boardgames = Boardgame.all
  end
  
end
