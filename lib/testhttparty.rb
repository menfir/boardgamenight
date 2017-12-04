require 'bgg_search'

bgg = BggSearch.new()
response = bgg.search("7 wonders")
presponse = response.parsed_response
presponse["items"]["item"].each do |item|
  puts item["name"]["value"]
  puts item["id"]  
end
