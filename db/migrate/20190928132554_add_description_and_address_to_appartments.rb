class AddDescriptionAndAddressToAppartments < ActiveRecord::Migration[5.1]
  def change
    add_column :appartments, :description, :text
    add_column :appartments, :address, :string
  end
end
