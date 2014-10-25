class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.text :link
      t.text :tooltip
      t.text :cooking_link
      t.integer :category_id, :null => false
      t.integer :provider_id, :null => false

      t.timestamps
    end
    add_index :items, :category_id
    add_index :items, :provider_id
  end
end
