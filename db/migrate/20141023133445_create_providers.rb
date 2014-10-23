class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, :null => false
      t.text :website

      t.timestamps
    end
    add_index :providers, :name, unique: true
    add_index :providers, :website, unique: true
  end
end
