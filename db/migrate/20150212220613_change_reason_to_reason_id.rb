class ChangeReasonToReasonId < ActiveRecord::Migration
  def change
    rename_column :invalid_votes, :reason, :reason_id
  end
end
