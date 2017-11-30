class Boardgame < ActiveRecord::Base
    has_and_belongs_to_many :users
    
    def self.search(search)
        where("name like ?", "%#{search}%")
    end
    
end
