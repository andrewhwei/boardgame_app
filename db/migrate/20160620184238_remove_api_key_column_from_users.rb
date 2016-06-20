class RemoveApiKeyColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :api_key, :text
  end
end
