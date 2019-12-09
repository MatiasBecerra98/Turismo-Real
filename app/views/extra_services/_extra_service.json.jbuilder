json.extract! extra_service, :id, :reservation_id, :created_at,
              :updated_at, :service
json.url extra_service_url(extra_service, format: :json)
