class AddSubordinatesCountToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :subordinates_count, :integer, default: 0
  end
end
