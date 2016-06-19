class OwnershipsController < ApplicationController
  before_action :authenticate_logged_on!, only: [:index]

  def index
    @owned_boardgames = current_user.ownerships.joins(:boardgame).order('name')
    undisplayed_owned_boardgames = Boardgame.joins(:ownerships).where("ownerships.user_id = ?", current_user.id).select("boardgames.id")
    @unowned_boardgames = Boardgame.where("id NOT IN (?)", undisplayed_owned_boardgames).select("id, name").order(:name)
    # owned_boardgames_ids = Ownership.where("user_id = ?", current_user.id).select("boardgame_id as id")
    # unowned_boardgames_ids = Boardgame.where("id NOT IN (?)", owned_boardgames_ids).select("id as id")
    # @unowned_boardgames = Boardgame.joins(unowned_boardgames_ids).where("id = (?)", unowned_boardgames_ids)
  end

  def create
    ownership = Ownership.new(user_id: params[:user_id], rating: params[:rating], num_of_plays: params[:number_of_plays], boardgame_id: params[:boardgame][:boardgame_id])
    authenticate_user(ownership.user_id)
    ownership.save
    redirect_to "/owned_games"
  end

  def edit
    @ownership = Ownership.find_by(id: params[:id])
    authenticate_user(@ownership.user_id)
  end

  def update
    ownership = Ownership.find_by(id: params[:id])
    authenticate_user(ownership.user_id)
    ownership.rating = params[:rating]
    ownership.num_of_plays = params[:number_of_plays]
    ownership.save
    redirect_to "/owned_games"
  end

  def destroy
    ownership = Ownership.find_by(id: params[:id])
    authenticate_user(ownership.user_id)
    ownership.delete
    redirect_to "/owned_games"
  end

end
