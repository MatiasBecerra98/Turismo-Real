json.extract! reservation, :id, :user_id, :appartment_id, :starting_date, :ending_date, :total_cost, :paid, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
