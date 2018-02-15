class UpdateListDate < ActiveRecord::Migration[5.1]
  def change
    change_column :lists, :date, :date
  end
end
