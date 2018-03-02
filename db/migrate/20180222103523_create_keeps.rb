class CreateKeeps < ActiveRecord::Migration[5.1]
  def change
    create_table :keeps do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index :keeps, :user_id
    add_index :keeps, :article_id
  end
end
