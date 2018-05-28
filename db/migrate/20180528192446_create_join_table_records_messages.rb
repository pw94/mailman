class CreateJoinTableRecordsMessages < ActiveRecord::Migration[5.1]
  def change
    create_join_table :records, :messages do |t|
      t.index [:record_id, :message_id]
    end
  end
end
