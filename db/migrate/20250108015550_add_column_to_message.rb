class AddColumnToMessage < ActiveRecord::Migration[6.1]
  
  def change
    # 未読を把握する項目
    add_column :messages, :read, :boolean
  end
end
