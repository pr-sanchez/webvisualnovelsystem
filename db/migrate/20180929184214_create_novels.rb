class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
