# class appartment that have the nigth cost
class Appartment < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one :appartment_quality, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  def cable
    appartment_quality.try(:cable) || false
  end

  def conditioned_air
    appartment_quality.try(:conditioned_air) || false
  end

  def internet
    appartment_quality.try(:internet) || false
  end

  def calefaction
    appartment_quality.try(:calefaction) || false
  end

  def image_url
    return rails_blob_url(image, disposition: 'attachment') unless
    image.attachment.nil?

    nil
  end
end
