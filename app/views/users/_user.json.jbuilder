json.extract! user, :id, :first_name, :last_name, :email, :role, :about, :cover, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)