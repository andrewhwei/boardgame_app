class CreateCategorizedBoardgames < ActiveRecord::Migration
  def change
    create_table :categorized_boardgames do |t|
      t.integer :category_id
      t.integer :boardgame_id

      t.timestamps null: false
    end
  end
end
