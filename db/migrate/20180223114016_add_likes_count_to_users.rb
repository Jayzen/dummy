class AddLikesCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :likes_count, :integer, default: 0
  end
end
