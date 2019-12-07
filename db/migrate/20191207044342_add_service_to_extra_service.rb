class AddServiceToExtraService < ActiveRecord::Migration[5.2]
  def change
    add_reference :extra_services, :service, foreign_key: true
  end
end
