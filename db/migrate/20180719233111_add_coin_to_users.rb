class AddCoinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coin, :integer, :null => false, :default => 0
  end
end
