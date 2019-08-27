ActiveAdmin.register Appartment do
  permit_params :nightly_fee

  index do
    selectable_column
    id_column
    column :nightly_fee
    actions
  end

  filter :nightly_fee

  form do |f|
    f.inputs do
      f.input :nightly_fee
    end
    f.actions
  end
end
