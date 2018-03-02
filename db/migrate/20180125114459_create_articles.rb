class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :slug
      t.integer :category_id
      t.integer :view_count, default: 0
      t.integer :comments_count, default: 0
      t.boolean :status, default: false
  
      t.timestamps
    end

    add_index :articles, :user_id
    add_index :articles, :category_id
    add_index :articles, :slug, unique: true
  end
end
