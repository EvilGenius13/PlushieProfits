class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :auth_id
      t.string :username
      t.string :balance

      t.timestamps
    end
  end
end
