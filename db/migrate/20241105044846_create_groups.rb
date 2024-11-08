class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :user_id
      t.text :comment
      t.string :hobby_1
      t.string :hobby_2
      t.string :hobby_3
      t.string :hobby_4
      t.string :hobby_5

      t.timestamps
    end
  end
end
