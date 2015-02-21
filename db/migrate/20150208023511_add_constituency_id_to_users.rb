class AddConstituencyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :constituency_id, :integer
    add_index :users, :constituency_id, :unique => true
  end
end
