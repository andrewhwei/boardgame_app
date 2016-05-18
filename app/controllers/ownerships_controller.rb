class OwnershipsController < ApplicationController

  def index
    # @unowned_boardgames = Boardgame.where("id != ?", Ownership.)
  end

  def create
    ownership = Ownership.new(user_id: params[:user_id], rating: params[:rating], num_of_plays: params[:number_of_plays], boardgame_id: params[:boardgame][:boardgame_id])
    ownership.save
    redirect_to "/owned_games"
  end

  def edit
    @ownership = Ownership.find_by(id: params[:id])
  end

  def update
    ownership = Ownership.find_by(id: params[:id])
    ownership.rating = params[:rating]
    ownership.num_of_plays = params[:number_of_plays]
    ownership.save
    redirect_to "/owned_games"
  end

  def destroy
    ownership = Ownership.find_by(id: params[:id])
    ownership.delete
    redirect_to "/owned_games"
  end

end
