class ExtraService < ApplicationRecord
  belongs_to :reservation
  has_one :service

  def service
    Service.find(service_id)
  end
end
