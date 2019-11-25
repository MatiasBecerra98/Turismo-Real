ActiveAdmin.register Appartment do
  permit_params :nightly_fee, :address, :name

  index do
    selectable_column
    id_column
    column :nightly_fee
    column :address
    column :name
    actions
  end

  filter :nightly_fee

  form do |f|
    f.inputs do
      f.input :nightly_fee
      f.input :address
      f.input :name
    end
    f.actions
  end
end
