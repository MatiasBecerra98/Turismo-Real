class CreateAppartments < ActiveRecord::Migration[5.1]
  def change
    create_table :appartments do |t|
      t.integer :nightly_fee

      t.timestamps
    end
  end
end
