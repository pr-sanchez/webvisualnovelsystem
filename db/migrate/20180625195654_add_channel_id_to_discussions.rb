class AddChannelIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :channel_id, :integer
  end
end
