class AddCharacterNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :character_name, :string
  end
end
