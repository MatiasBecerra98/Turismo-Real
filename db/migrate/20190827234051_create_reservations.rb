class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :appartment, foreign_key: true
      t.date :starting_date
      t.date :ending_date
      t.integer :total_cost
      t.boolean :paid

      t.timestamps
    end
  end
end
