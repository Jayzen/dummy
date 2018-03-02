class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.boolean :admin, default: false
      t.boolean :superadmin, default: false
      t.boolean :forbidden, default: false
      t.string :remember_digest
      t.string :avatar
      t.string :activation_digest
      t.boolean :activated, default: false
      t.string :gender
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.string :slug
      t.integer :notifications_count, default: 0
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :slug, unique: true
  end
end
