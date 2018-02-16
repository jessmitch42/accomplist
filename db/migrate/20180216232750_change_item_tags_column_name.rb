class ChangeItemTagsColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :item_tags, :list_id, :item_id
  end
end
