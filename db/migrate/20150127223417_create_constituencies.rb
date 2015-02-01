class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.integer :number
      t.integer :mandates
      t.integer :ballots
      t.integer :voters
      t.references :province, index: true

      t.timestamps null: false
    end
    add_foreign_key :constituencies, :provinces
  end
end
