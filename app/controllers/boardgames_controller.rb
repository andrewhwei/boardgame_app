class BoardgamesController < ApplicationController
    before_action :authenticate_admin!

  def index
    @boardgames = Boardgame.all.order(:name)
    @index_check = 0
  end
  
end
