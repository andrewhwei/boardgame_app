class BoardgamesController < ApplicationController
    before_action :authenticate_admin!

  def index

  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    new_boardgame = Boardgame.create(checkbox_params)
    redirect_to "/boardgames"
  end

  def edit
    @boardgame = Boardgame.find_by(id: params[:id])
    #will need to find the categorized boardgames so can show what boxes are checked
  end

  def update
    boardgame = Boardgame.find_by(id: params[:id])
    boardgame.update(name: params[:name], developer: params[:developer])
    redirect_to "/boardgames"
  end

  def destroy
    boardgame = Boardgame.find_by(id: params[:id])
    categories = CategorizedBoardgame.where("boardgame_id = ?", boardgame.id)
    categories.each do |category|
      category.delete
    end
    boardgame.delete
    redirect_to "/boardgames"
  end

  private
  def checkbox_params
    params.require(:boardgame).permit(:name, :developer, category_ids: [])
  end

end