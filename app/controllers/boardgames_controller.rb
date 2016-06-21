class BoardgamesController < ApplicationController
  before_action :authenticate_admin!

  def index

  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    @boardgame = Boardgame.new(checkbox_params)
    if @boardgame.save
      flash[:success] = "Boardgame added"
      redirect_to "/boardgames"
    else
      flash[:danger] = @boardgame.errors.full_messages
      render :new
    end
  end

  def edit
    @boardgame = Boardgame.find_by(id: params[:id])
  end

  def update
    @boardgame = Boardgame.find_by(id: params[:id])
    if @boardgame.update(checkbox_params)
      flash[:success] = "Boardgame added"
      redirect_to "/boardgames"
    else
      flash[:danger] = @boardgame.errors.full_messages
      render :edit
    end
  end

  def destroy
    boardgame = Boardgame.find_by(id: params[:id])
    if !boardgame.nil?
      categories = CategorizedBoardgame.where("boardgame_id = ?", boardgame.id)
      categories.each do |category|
        category.delete
      end
      boardgame.delete
      flash[:success] = "Boardgame deleted"
      redirect_to "/boardgames"
    else
      flash[:danger] = "Boardgame not found"
      redirect_to "/boardgames"
    end
  end

  private
  def checkbox_params
    params.require(:boardgame).permit(:name, :developer, category_ids: [])
  end

end