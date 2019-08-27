class CreateExtraServices < ActiveRecord::Migration[5.1]
  def change
    create_table :extra_services do |t|
      t.references :reservation, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
