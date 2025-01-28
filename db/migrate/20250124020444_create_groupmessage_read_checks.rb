class CreateGroupmessageReadChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :groupmessage_read_checks do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :groupmessage_id
      t.boolean :read

      t.timestamps
    end
  end
end
