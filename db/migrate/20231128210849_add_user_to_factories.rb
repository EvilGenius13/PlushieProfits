class AddUserToFactories < ActiveRecord::Migration[7.1]
  def change
    add_reference :factories, :user, null: false, foreign_key: true
  end
end
