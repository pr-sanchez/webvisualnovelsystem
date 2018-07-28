class AddSlugToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :slug, :string
  end
end
