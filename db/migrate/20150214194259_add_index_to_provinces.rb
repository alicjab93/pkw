class AddIndexToProvinces < ActiveRecord::Migration
  def change
    add_index :provinces, :name, unique: true
  end
end
