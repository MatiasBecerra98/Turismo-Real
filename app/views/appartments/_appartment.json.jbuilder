json.extract! appartment, :id, :nightly_fee, :name, :address, :created_at,
              :updated_at, :appartment_quality, :reservations
json.url appartment_url(appartment, format: :json)
