json.extract! review, :id, :wine_id, :comment, :rating, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
