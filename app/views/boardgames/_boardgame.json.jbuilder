json.extract! boardgame, :id, :name, :img, :description, :created_at, :updated_at
json.url boardgame_url(boardgame, format: :json)
