class Collection < ActiveRecord::Base
    belongs_to :boardgame
    belongs_to :user
end
