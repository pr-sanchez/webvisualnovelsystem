class AddCharacterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :character_id, :integer
  end
end
