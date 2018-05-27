class CreateJoinTableUsersRecords < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :records do |t|
      t.index [:user_id, :record_id]
    end
  end
end
