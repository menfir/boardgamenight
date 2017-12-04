class BggSearch
    include HTTParty
    debug_output $stdout
    base_uri 'https://www.boardgamegeek.com/xmlapi2'


    def search(searchquery)
        options = {query: {query: searchquery}}
        self.class.get("/search", options)
    end

    def get_boardgame(bgid)
        options = {query: {id: bgid}}
        self.class.get("/thing?", options)
    end

    def testurl(url)
      HTTParty.get(url)
    end

end
