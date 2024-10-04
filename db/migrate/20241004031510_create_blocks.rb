class CreateBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :blocks do |t|
      t.string :user_id
      t.string :blocked_user_id

      t.timestamps
    end
  end
end
