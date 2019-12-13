class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_uniqueness_of :email

  has_many :reservations

  has_secure_password

  def full_name
    name.to_s + " " + last_name.to_s
  end
end
