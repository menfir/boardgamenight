class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collections
  has_many :boardgames, through: :collections

  def add_to_collection!(boardgame)
    collections.create!(boardgame_id: boardgame.id, status: "owned")
  end

  def remove_from_collection!(boardgame)
    collections.find_by(boardgame_id: boardgame.id).destroy
  end

  def in_collection?(boardgame)
    collections.find_by(boardgame_id: boardgame.id)
  end

end
