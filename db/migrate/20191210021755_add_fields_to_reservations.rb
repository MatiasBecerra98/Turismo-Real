class AddFieldsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :check_in, :boolean
    add_column :reservations, :check_out, :boolean
    add_column :reservations, :check_in_date, :datetime
    add_column :reservations, :check_out_date, :datetime
  end
end
