class CreateBoardgames < ActiveRecord::Migration
  def change
    create_table :boardgames do |t|
      t.string :name
      t.string :img
      t.text :description

      t.timestamps null: false
    end
  end
end
