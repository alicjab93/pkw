class AddUserIdToConstituencies < ActiveRecord::Migration
  def change
    add_column :constituencies, :user_id, :integer
    add_index :constituencies, :user_id, :unique => true
  end
end
