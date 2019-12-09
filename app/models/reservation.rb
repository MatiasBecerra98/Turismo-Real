class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :appartment
  has_many :extra_services

  def appartment
    appartment = Appartment.find(appartment_id)
    {
      id: appartment.id,
      nightly_fee: appartment.nightly_fee,
      name: appartment.name,
      description: appartment.description,
      addres: appartment.address,
      created_at: appartment.created_at,
      updated_at: appartment.updated_at,
      cabl: appartment.cable,
      conditioned_air: appartment.conditioned_air,
      internet: appartment.internet,
      calefaction: appartment.calefaction,
      image_url: appartment.image_url
    }
  end
end
