json.extract! appartment, :id, :nightly_fee, :name, :address, :created_at,
              :updated_at, :reservations, :cable, :conditioned_air,
              :internet, :calefaction, :image_url
json.url appartment_url(appartment, format: :json)
