class CreateProviderCategoryJoinTable < ActiveRecord::Migration
  def change
    create_join_table :providers, :categories do |t|
      t.index [:provider_id, :category_id], unique: true
      t.index [:category_id, :provider_id], unique: true
    end
  end
end
