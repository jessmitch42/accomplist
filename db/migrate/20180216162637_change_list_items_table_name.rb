class ChangeListItemsTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :list_items, :items
  end
end
