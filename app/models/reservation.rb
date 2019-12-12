class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :appartment
  has_many :extra_services

  validate :validate_dates

  def validate_dates
    appartment = self.appartment
    used_reservations = Reservation.where(
      'appartment_id = ? AND starting_date >= ? AND ending_date <= ?',
      appartment.id,
      starting_date.beginning_of_day,
      ending_date.end_of_day
    )

    unless used_reservations.empty?
      errors.add(:error, 'Existe reservación')
      return false
    end

    true
  end
end
