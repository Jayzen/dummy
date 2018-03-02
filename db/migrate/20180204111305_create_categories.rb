class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancestry
      t.integer :weight, default: 0

      t.timestamps
    end
    add_index :categories, :ancestry
    add_index :categories, :name
  end
end
