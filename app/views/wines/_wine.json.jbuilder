json.extract! wine, :id, :winery_id, :grape_varietal_id, :vintage, :category_id, :description_id, :created_at, :updated_at
json.url wine_url(wine, format: :json)
