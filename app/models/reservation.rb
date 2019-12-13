class Reservation < ApplicationRecord
  include ActionDispatch::Routing::PolymorphicRoutes
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :appartment
  has_many :extra_services, dependent: :destroy
  has_one_attached :pdf, dependent: :destroy

  validate :validate_starting_date
  validate :validate_dates

  def validate_dates
    appartment = self.appartment
    used_reservations = Reservation.where(
      'appartment_id = ? AND starting_date >= ? AND ending_date <= ?',
      appartment.id,
      starting_date.beginning_of_day,
      ending_date.end_of_day
    )

    if used_reservations.count > 1
      errors.add(:error, 'Existe reservación')
      return false
    end

    true
  end

  def validate_starting_date
    if starting_date.to_date.beginning_of_day < Time.now.beginning_of_day
      errors.add(:error, 'Fecha no puede ser menor a la fecha de hoy')
      return false
    end

    true
  end

  def url_pdf_s3
    return polymorphic_url(pdf) unless pdf.attachment.nil?

    nil
  end
end
