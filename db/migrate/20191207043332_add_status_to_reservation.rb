class AddStatusToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :status, :boolean, default: 1
  end
end
