class CreateProviderSourceJoinTable < ActiveRecord::Migration
  def change
    create_join_table :providers, :sources do |t|
      t.index [:provider_id, :source_id], unique: true
      t.index [:source_id, :provider_id], unique: true
    end
  end
end
