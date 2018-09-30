class AddUserIdToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :user_id, :integer
  end
end
