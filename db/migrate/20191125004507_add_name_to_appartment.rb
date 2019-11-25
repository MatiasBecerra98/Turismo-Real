class AddNameToAppartment < ActiveRecord::Migration[5.1]
  def change
    add_column :appartments, :name, :string
  end
end
