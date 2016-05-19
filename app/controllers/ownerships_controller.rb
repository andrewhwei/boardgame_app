class OwnershipsController < ApplicationController

  def index
    @user = User.find_by(id: current_user.id)
    if !current_user || current_user.id != @user.id
      redirect_to "/"
    end

    # owned_boardgames_ids = Ownership.where("user_id = ?", current_user.id).select("boardgame_id as id")
    # unowned_boardgames_ids = Boardgame.where("id NOT IN (?)", owned_boardgames_ids).select("id as id")
    # @unowned_boardgames = Boardgame.joins(unowned_boardgames_ids).where("id = (?)", unowned_boardgames_ids)
    # owned_boardgames = Boardgame.joins(:ownerships).where("ownerships.user_id = ?", current_user.id).select("boardgames.id, boardgames.name")
    # @unowned_boardgames = Boardgame.where("id NOT IN (?)", owned_boardgames).select("id, name")

    owned_boardgames = Boardgame.joins(:ownerships).where("ownerships.user_id = ?", current_user.id).select("boardgames.id")
    @unowned_boardgames = Boardgame.where("id NOT IN (?)", owned_boardgames).select("id, name")
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
