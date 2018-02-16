class ChangeNameOfListTags < ActiveRecord::Migration[5.1]
  def change
    rename_table :list_tags, :item_tags
  end
end
