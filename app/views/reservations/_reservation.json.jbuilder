json.extract! reservation, :id, :user_id, :appartment, :starting_date,
              :ending_date, :total_cost, :paid, :created_at, :updated_at,
              :status
json.extra_services reservation.extra_services do |ex|
  json.id ex.id
  json.created_at ex.created_at
  json.service do
    json.id ex.service.id
    json.name ex.service.name
    json.price ex.service.price
    json.status ex.service.status
    json.created_at ex.service.created_at
  end
end
json.url reservation_url(reservation, format: :json)
