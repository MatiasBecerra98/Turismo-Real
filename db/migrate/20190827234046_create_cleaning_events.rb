class CreateCleaningEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :cleaning_events do |t|
      t.references :appartment, foreign_key: true
      t.datetime :time_of_event
      t.references :janitor, foreign_key: true
      t.boolean :reminder_sent

      t.timestamps
    end
  end
end
