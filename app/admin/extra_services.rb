ActiveAdmin.register ExtraService do
  permit_params :reservation_id, :name
  index do
    selectable_column
    id_column
    column :reservation_id
    column :name
    actions
  end

  filter :reservation_id
  filter :name

  form do |f|
  f.inputs do
    f.input :reservation_id
    f.input :name
  end
  f.actions
  end
end
