class AddProfilePictureIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture, :integer
  end
end
