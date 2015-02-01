class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.string :logo

      t.timestamps null: false
    end
  end
end
