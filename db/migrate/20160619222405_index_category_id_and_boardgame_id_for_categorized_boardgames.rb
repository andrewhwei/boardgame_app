class IndexCategoryIdAndBoardgameIdForCategorizedBoardgames < ActiveRecord::Migration
  def change
    add_index :categorized_boardgames, :category_id
    add_index :categorized_boardgames, :boardgame_id
  end
end
