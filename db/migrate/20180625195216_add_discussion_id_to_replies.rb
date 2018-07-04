class AddDiscussionIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :discussion_id, :integer
  end
end
