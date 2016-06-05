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
    
  end

  def update
    
  end

end