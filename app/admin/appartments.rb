ActiveAdmin.register Appartment do
  permit_params :nightly_fee, :address, :name, :image

  index do
    selectable_column
    id_column
    column :nightly_fee
    column :address
    column :name
    column 'Image' do |appartment|
      url_for(appartment.image) unless appartment.image.attachment.nil?
    end
    actions
  end

  show do
    attributes_table do
      row :nightly_fee
      row :address
      row :name
      row :image do |appartment|
        url_for(appartment.image)
      end
    end
  end

  filter :nightly_fee

  form do |f|
    f.inputs do
      f.input :nightly_fee
      f.input :address
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end
end
