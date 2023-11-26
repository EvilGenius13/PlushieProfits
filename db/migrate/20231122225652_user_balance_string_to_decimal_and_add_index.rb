class UserBalanceStringToDecimalAndAddIndex < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :balance, :decimal, precision: 10, scale: 2
    add_index :users, :auth_id, unique: true
  end
end
