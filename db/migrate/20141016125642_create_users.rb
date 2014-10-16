class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin,                  default: false
      t.string :first_name,                                     null: false
      t.string :last_name,                                      null: false

      t.timestamps
    end

  end
end
