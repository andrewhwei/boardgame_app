class Api::V1::BoardgamesController < ApplicationController

  def index
    @boardgames = Boardgame.all.order(:id)
  end

end
