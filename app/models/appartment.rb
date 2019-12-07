# class appartment that have the nigth cost
class Appartment < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one :appartment_quality, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  def cable
    appartment_quality.try(:cable) || false
  end

  def self.populate
    ActiveRecord::Base.connection.tables.each_with_index do |table, index|
      2.times do |time|
          faker_boolean = Faker::Boolean.boolean(true_ratio: 0.2)
          faker_string = Faker::String.random(length: 3..12)
          faker_number = Faker::Number.number(digits: 5)
          faker_date_from = Faker::Date.between(from: 2.days.ago, to: Date.today)
          faker_date_to = Faker::Date.between(from: Date.today, to: Date.today + 2.days)
          unless ["active_admin_comments","admin_users","schema_migrations", "ar_internal_metadata", "active_storage_blobs", "active_storage_attachments"].include?(table)
              case table
              when "profiles"
                  params = { name: faker_string }
              when "appartment_qualities"
                  params = { appartment_id: Appartment.last.id, cable: faker_boolean, conditioned_air: faker_boolean, internet: faker_boolean, calefaction: faker_boolean}
              when "appartments"
                  params = { nightly_fee: faker_number, description: faker_string, address: faker_string, name: faker_string }
              when "cleaning_events"
                  params = {  appartment_id: Appartment.last.id, time_of_event: "2016-08-03 02:05:00", janitor_id: 1, reminder_sent: true, }
              when "janitors"
                  params = {  name: faker_string }
              when "supplies"
                  params = {  name: faker_string, cost: faker_number }
              when "supply_movements"
                  params = {  supply_id: Supply.last.id, appartment_id: Appartment.last.id, movement: faker_number }
              when "services"
                  params = { name: faker_string, price: faker_number, status: faker_boolean }
              when "extra_services"
                  params = {  reservation_id: faker_number, service_id: Service.create(name: faker_string, price: faker_number, status: faker_boolean).id }
              when "reservations"
                  params = {  user_id: User.last.id, appartment_id: Appartment.first.id, starting_date: faker_date_from, ending_date: faker_date_to, total_cost: faker_number, paid: faker_boolean, status: faker_boolean }
              end

              table.singularize.camelize.constantize.create(params)
            end
      end
    end
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
    unless image.attachment.nil?
      return "https://turismorealbucket.s3.amazonaws.com/#{image.key}"
    end

    nil
  end
end
