class IndexProfilePictureIdForUser < ActiveRecord::Migration
  def change
    add_index :users, :profile_picture
  end
end
