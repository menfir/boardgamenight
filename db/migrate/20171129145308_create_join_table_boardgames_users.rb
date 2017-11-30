class CreateJoinTableBoardgamesUsers < ActiveRecord::Migration
  def change
    create_join_table :boardgames, :users do |t|
      # t.index [:boardgame_id, :user_id]
      # t.index [:user_id, :boardgame_id]
    end
  end
end
