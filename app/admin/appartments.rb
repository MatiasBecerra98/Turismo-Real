ActiveAdmin.register Appartment do
  permit_params :nightly_fee, :address, :name, :image, :description

  index do
    selectable_column
    id_column
    column :nightly_fee
    column :address
    column :name
    column :description
    column 'Image' do |appartment|
      appartment.image_url
    end
    actions
  end

  show do
    attributes_table do
      row :nightly_fee
      row :address
      row :name
      row :description
      row :image do |appartment|
        appartment.image_url
      end
    end
  end

  filter :nightly_fee

  form do |f|
    f.inputs do
      f.input :nightly_fee
      f.input :address
      f.input :name
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end
end
