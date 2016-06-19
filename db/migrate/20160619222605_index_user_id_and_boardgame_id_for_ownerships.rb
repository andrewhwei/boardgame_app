class IndexUserIdAndBoardgameIdForOwnerships < ActiveRecord::Migration
  def change
    add_index :ownerships, :user_id
    add_index :ownerships, :boardgame_id
  end
end
