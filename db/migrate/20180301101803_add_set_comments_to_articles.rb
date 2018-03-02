class AddSetCommentsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :set_comments, :boolean, default: true
  end
end
