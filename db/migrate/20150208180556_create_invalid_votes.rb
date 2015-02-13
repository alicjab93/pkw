class CreateInvalidVotes < ActiveRecord::Migration
  def self.up
    create_table :invalid_votes do |t|
      t.integer :constituency_id
      t.integer :reason
      t.integer :quantity

      t.timestamps null: false
    end
    
    add_index :invalid_votes, [:constituency_id, :reason], :unique => true
  end

  def self.down
    remove_index :invalid_votes, :column => [:constituency_id, :reason]
    drop_table :invalid_votes
  end    
end
