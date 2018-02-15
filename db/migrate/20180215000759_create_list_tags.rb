class CreateListTags < ActiveRecord::Migration[5.1]
  def change
    create_table :list_tags do |t|
      t.integer :list_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
