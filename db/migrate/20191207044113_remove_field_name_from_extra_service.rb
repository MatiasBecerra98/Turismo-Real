class RemoveFieldNameFromExtraService < ActiveRecord::Migration[5.2]
  def change
    remove_column :extra_services, :name, :string
  end
end
