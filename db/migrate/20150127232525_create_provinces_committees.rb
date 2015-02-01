class CreateProvincesCommittees < ActiveRecord::Migration
  # def change
    # create_table :provinces_committees do |t|
    # end
  # end
  def self.up
    # Create the association table
    create_table :provinces_committees, :id => false do |t|
      t.integer :province_id, :null => false
      t.integer :committee_id, :null => false
    end

    # Add table index
    add_index :provinces_committees, [:province_id, :committee_id], :unique => true

  end

  def self.down
    remove_index :provinces_committees, :column => [:province_id, :committee_id]
    drop_table :provinces_committees
  end  
end
