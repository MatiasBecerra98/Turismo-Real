# class appartment that have the nigth cost
class Appartment < ApplicationRecord
  has_one :appartment_quality
  has_many :reservations

  def cable
    self.appartment_quality.try(:cable) || false
  end

  def conditioned_air
    self.appartment_quality.try(:conditioned_air) || false
  end

  def internet
    self.appartment_quality.try(:internet) || false
  end

  def calefaction
    self.appartment_quality.try(:calefaction) || false
  end

end
