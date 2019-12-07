ActiveAdmin.register Service do
  permit_params :name, :price, :status
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :status
    actions
  end

  filter :name
  filter :price
  filter :status

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :status
    end
    f.actions
  end
end
