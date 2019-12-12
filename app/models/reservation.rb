class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :appartment
  has_many :extra_services
end
