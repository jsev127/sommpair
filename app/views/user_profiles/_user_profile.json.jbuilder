json.extract! user_profile, :id, :first_name, :last_name, :username, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
json.token user.generate_jwt