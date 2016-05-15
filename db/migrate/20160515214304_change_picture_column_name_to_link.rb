class ChangePictureColumnNameToLink < ActiveRecord::Migration
  def change
    rename_column :pictures, :pic, :link
  end
end
