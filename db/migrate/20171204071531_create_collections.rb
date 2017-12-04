class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :boardgame_id
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
