class CleaningEvent < ApplicationRecord
  belongs_to :appartment
  belongs_to :janitor
end
