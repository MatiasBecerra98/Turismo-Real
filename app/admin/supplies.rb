ActiveAdmin.register Supply do
  permit_params :name, :cost
  index do
    selectable_column
    id_column
    column :name
    column :cost
    actions
  end

  filter :name
  filter :cost

  form do |f|
    f.inputs do
      f.input :name
      f.input :cost
    end
    f.actions
  end
end
