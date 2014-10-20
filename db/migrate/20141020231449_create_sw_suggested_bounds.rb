class CreateSwSuggestedBounds < ActiveRecord::Migration
  def change
    create_table :sw_suggested_bounds do |t|
      t.decimal :lat
      t.decimal :lng
      t.belongs_to :location

      t.timestamps
    end
    add_index :sw_suggested_bounds, [:lat, :lng]
  end
end
