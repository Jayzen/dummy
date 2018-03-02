class AddLikesCountToArticle < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :likes_count
    add_column :articles, :likes_count, :integer, default: 0
  end
end
