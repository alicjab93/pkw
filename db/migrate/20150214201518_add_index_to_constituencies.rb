class AddIndexToConstituencies < ActiveRecord::Migration
  def change
    add_index :constituencies, [:number, :province_id], unique: true
  end
end
