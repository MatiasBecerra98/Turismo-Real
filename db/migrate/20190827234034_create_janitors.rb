class CreateJanitors < ActiveRecord::Migration[5.1]
  def change
    create_table :janitors do |t|
      t.string :name

      t.timestamps
    end
  end
end
