class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :title
      t.integer :points, default: 1

      t.timestamps
    end
  end
end
