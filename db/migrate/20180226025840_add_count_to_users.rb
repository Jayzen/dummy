class AddCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comments_count, :integer, default: 0
    add_column :users, :articles_count, :integer, default: 0
    add_column :users, :following_count, :integer, default: 0
    add_column :users, :followers_count, :integer, default: 0
  end
end
