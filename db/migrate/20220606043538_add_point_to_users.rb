class AddPointToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :point, :float
  end
end
