json.extract! cleaning_event, :id, :appartment_id, :time_of_event, :janitor_id, :reminder_sent, :created_at, :updated_at
json.url cleaning_event_url(cleaning_event, format: :json)
