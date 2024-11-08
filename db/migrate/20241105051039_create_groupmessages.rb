class CreateGroupmessages < ActiveRecord::Migration[6.1]
  def change
    create_table :groupmessages do |t|
      t.integer :user_id
      t.text :message
      t.integer :group_id

      t.timestamps
    end
  end
end
