class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :channel

      t.timestamps null: false
    end
  end
end
