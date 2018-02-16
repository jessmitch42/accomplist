class AddPointsToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :total_points, :integer, default: 0
  end
end
