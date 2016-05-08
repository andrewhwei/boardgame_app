class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :boardgame_id
      t.integer :rating
      t.integer :num_of_plays

      t.timestamps null: false
    end
  end
end
