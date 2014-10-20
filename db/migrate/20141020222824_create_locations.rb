class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :sub_premise
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :state_code
      t.string :state_name
      t.string :zip
      t.string :country_code
      t.string :province
      t.string :precision
      t.string :full_address
      t.decimal :lat
      t.decimal :lng
      t.string :provider
      t.string :district
      t.string :country
      t.integer :accuracy

      t.timestamps
    end
    add_index :locations, [:lat, :lng]

  end
end
