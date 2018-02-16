class ChangeListItemsTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :items, :items
  end
end
