class Api::V1::BoardgamesController < ApplicationController

  def index
    @boardgames = Boardgame.all.order(:id)
  end

  def create

  end

  def update
    
  end

  def destroy
    boardgame = Boardgame.find_by(id: params[:id])
    categories = CategorizedBoardgame.where("boardgame_id = ?", boardgame.id)
    categories.each do |category|
      category.delete
    end
    boardgame.delete
    render json: {message: "Boardgame Deleted"}
  end

end
