class AddDescriptionToSource < ActiveRecord::Migration
  def change
    add_column :sources, :description, :text
  end
end
