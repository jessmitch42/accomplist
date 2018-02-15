class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.string :title
      t.integer :points

      t.timestamps
    end
  end
end
