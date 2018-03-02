class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :article_id
  end
end
