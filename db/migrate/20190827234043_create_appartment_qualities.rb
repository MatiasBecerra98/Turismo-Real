class CreateAppartmentQualities < ActiveRecord::Migration[5.1]
  def change
    create_table :appartment_qualities do |t|
      t.references :appartment, foreign_key: true
      t.boolean :cable
      t.boolean :conditioned_air
      t.boolean :internet
      t.boolean :calefaction

      t.timestamps
    end
  end
end
