class CreateSupplyMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :supply_movements do |t|
      t.references :supply, foreign_key: true
      t.references :appartment, foreign_key: true
      t.integer :movement

      t.timestamps
    end
  end
end
