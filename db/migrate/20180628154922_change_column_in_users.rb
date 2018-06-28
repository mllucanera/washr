class ChangeColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :role, "client"
  end
end
