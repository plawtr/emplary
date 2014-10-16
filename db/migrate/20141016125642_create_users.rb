class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
