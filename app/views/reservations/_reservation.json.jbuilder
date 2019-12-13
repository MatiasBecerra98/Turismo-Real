json.extract! reservation, :id, :user_id, :starting_date,
              :ending_date, :total_cost, :paid, :created_at, :updated_at,
              :status, :check_in, :check_in_date, :check_out, :check_out_date
json.appartment do
  json.id reservation.appartment.id
  json.nightly_fee reservation.appartment.nightly_fee
  json.name reservation.appartment.name
  json.description reservation.appartment.description
  json.address reservation.appartment.address
  json.created_at reservation.appartment.created_at
  json.updated_at reservation.appartment.updated_at
  json.cabl reservation.appartment.cable
  json.conditioned_air reservation.appartment.conditioned_air
  json.internet reservation.appartment.internet
  json.calefaction reservation.appartment.calefaction
  json.image_url reservation.appartment.image_url
end

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
