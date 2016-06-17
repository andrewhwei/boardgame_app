class BoardgamesController < ApplicationController
    before_action :authenticate_admin!

  def index

  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    new_boardgame = Boardgame.create(checkbox_params)
    redirect_to "/boardgames/#{new_boardgame.id}/edit"
  end

  def edit
    @boardgame = Boardgame.find_by(id: params[:id])
  end

  def update
    boardgame = Boardgame.find_by(id: params[:id])
    boardgame.update(name: params[:name], developer: params[:developer])
    redirect_to "/boardgames/#{boardgame.id}/edit"
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