json.extract! movie, :id, :title, :studio, :date, :price, :rating, :genre, :created_at, :updated_at
json.url movie_url(movie, format: :json)
