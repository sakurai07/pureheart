class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.string :name
      t.integer :grade
      t.integer :klass
      t.binary :icon
      t.text :profile
      t.string :color
      t.string :hobby_1
      t.string :hobby_2
      t.string :hobby_3
      t.string :hobby_4
      t.string :hobby_5

      t.timestamps
    end
  end
end
