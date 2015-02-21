class CreateValidVotes < ActiveRecord::Migration
  def self.up
    create_table :valid_votes do |t|
      t.integer :constituency_id
      t.integer :committee_id
      t.integer :quantity

      t.timestamps null: false
    end
    
    add_index :valid_votes, [:constituency_id, :committee_id], :unique => true    
  end

  def self.down
    remove_index :valid_votes, :column => [:constituency_id, :committee_id]
    drop_table :valid_votes
  end    
end
