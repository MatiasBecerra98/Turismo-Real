class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.boolean :status, default: 1

      t.timestamps
    end
  end
end
