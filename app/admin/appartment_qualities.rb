ActiveAdmin.register AppartmentQuality do
  permit_params :appartment_id, :cable, :conditioned_air, :internet,
                :calefaction, :created_at, :updated_at
  index do
    selectable_column
    id_column
    column :name
    column :appartment_id
    column :cable
    column :conditioned_air
    column :internet
    column :calefaction
    column :created_at
    actions
  end

  filter :name
  filter :appartment_id
  filter :cable
  filter :conditioned_air
  filter :internet
  filter :calefaction
  filter :created_at

  form do |f|
    f.inputs do
      f.input :appartment_id
      f.input :cable
      f.input :conditioned_air
      f.input :internet
      f.input :calefaction
    end
    f.actions
  end

end
