class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.text :link
      t.text :tooltip
      t.text :cooking_link
      t.integer :category_id, :null => false

      t.timestamps
    end
    add_index :items, :category_id, unique: true
  end
end
