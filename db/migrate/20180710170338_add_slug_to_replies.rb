class AddSlugToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :slug, :string
  end
end
