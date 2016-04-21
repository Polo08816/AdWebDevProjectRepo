json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :street_address, :phone_number, :user_type
  json.url user_url(user, format: :json)
end
