json.extract! user, :id, :created_at, :updated_at
json.email user.email
json.name user.name
json.last_name user.last_name
json.phone user.phone
json.rut user.rut
json.url user_url(user, format: :json)
