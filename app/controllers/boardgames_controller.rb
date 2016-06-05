class BoardgamesController < ApplicationController
    before_action :authenticate_admin!

  def index

  end

  def new

  end

  def create
    new_boardgame = Boardgame.new(name: params[:name], developer: params[:developer])
    if new_boardgame.save
      new_categorizedBoardgame = CategorizedBoardgame.new(category_id: params[:category][:category_id], boardgame_id: new_boardgame.id)
      new_categorizedBoardgame.save
      redirect_to "/boardgames"
    end
  end

  def edit
    @boardgame = Boardgame.find_by(id: params[:id])
  end

  def update
    boardgame = Boardgame.find_by(id: params[:id])
    boardgame.update(name: params[:name], developer: params[:developer])
    redirect_to "/boardgames"
  end

end