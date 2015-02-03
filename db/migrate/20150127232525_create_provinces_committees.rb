class CreateProvincesCommittees < ActiveRecord::Migration
  # def change
    # create_table :committees_provinces do |t|
    # end
  # end
  def self.up
    # Create the association table
    create_table :committees_provinces, :id => false do |t|
      t.integer :province_id, :null => false
      t.integer :committee_id, :null => false
    end

    # Add table index
    add_index :committees_provinces, [:province_id, :committee_id], :unique => true

  end

  def self.down
    remove_index :committees_provinces, :column => [:province_id, :committee_id]
    drop_table :committees_provinces
  end  
end
