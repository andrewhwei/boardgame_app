class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :mechanism

      t.timestamps null: false
    end
  end
end
