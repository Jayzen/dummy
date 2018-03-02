class RemoveColumnFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :following_count
    remove_column :users, :followers_count
  end
end
