class BggSearch
    include HTTParty
    debug_output $stdout
    base_uri 'https://www.boardgamegeek.com/xmlapi2'
     
    
    def search(searchquery)
        @options = {query: {query: searchquery}}
        self.class.get("/search", @options) 
    end
end