json.extract! user, :id, :name, :email, :address, :password_digest, :cc_number, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)