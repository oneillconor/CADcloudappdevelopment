json.extract! movie, :id, :title, :director, :releaseyear, :genere, :stock, :created_at, :updated_at
json.url movie_url(movie, format: :json)
