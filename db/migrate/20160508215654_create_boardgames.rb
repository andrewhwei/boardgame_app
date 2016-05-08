class CreateBoardgames < ActiveRecord::Migration
  def change
    create_table :boardgames do |t|
      t.string :name
      t.string :developer

      t.timestamps null: false
    end
  end
end
